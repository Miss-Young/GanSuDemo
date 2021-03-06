package com.powersi.ssm.biz.medicare.common.util;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;
import com.powersi.comm.exception.ApusException;
import com.powersi.hygeia.framework.util.Base64;
import com.powersi.pcloud.dict.service.DictService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import sun.misc.BASE64Decoder;

import java.io.*;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Map;

/**
 * TS20021100028 结算云增加工单、付款信息线上提示需求 杨世明 20200220
 * 基于sftp的文件存储管理
 *
 * @author huangyao
 */
public class SFTPUtils {

    private static WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();

    private SFTPUtils() {

    }

    private static Logger logger = LoggerFactory.getLogger(SFTPUtils.class);

    /**
     * 上传图片至sftp服务器上，其中图片是base64字符串格式
     *
     * @param imageBase64  图片base64字符串
     * @param fileName     保存的文件名
     * @param destFilePath 保存目标路径
     * @return 文件保存的完全路径
     */
    public static String uploadImageForBase64(String imageBase64, String fileName, String destFilePath) {
        if (StringUtils.isBlank(destFilePath) || StringUtils.isBlank(imageBase64)) {
            throw new ApusException("上传的图片或者目标路径为空");
        }
        DictService dictService = wac.getBean(DictService.class);
        String sftpDoFileDir = dictService.getValue("OSS_PARAM", "SFTP_DO_FILE_DIR", "/uploadFile");
        //由于对于SFTP的根目录权限是root的755，所以默认添加到/uploadFile（默认添加在服务器上的）
        if ("/".equals(destFilePath)) {
            destFilePath = sftpDoFileDir;
        } else {
            destFilePath = sftpDoFileDir + destFilePath;
        }
        Session session = loginSsh();
        ChannelSftp sshSftp = sshSftp(session);
        String afterLoadPath = destFilePath + fileName;

        try {
            try {
                sshSftp.cd(destFilePath);
            } catch (SftpException e) {
                logger.warn("SFTP工作目录：" + destFilePath + "不存在，正在创建并赋权775");
                String path;
                if (destFilePath.endsWith("/")) {
                    path = destFilePath.substring(1, destFilePath.length() - 1);
                } else {
                    path = destFilePath.substring(1);
                }
                String[] dirs = path.split("/");
                System.out.println(Arrays.toString(dirs));
                //一层一层，判断没有此层目录则创建
                String mkPath = "";
                for (String current_dir_name : dirs) {
                    try {
                        mkPath = mkPath + "/" + current_dir_name;
                        sshSftp.cd(mkPath);
                    } catch (SftpException ex) {
                        sshSftp.mkdir(mkPath);
                        sshSftp.chmod(Integer.parseInt("775", 8), mkPath);
                        sshSftp.cd(mkPath);
                    }
                }
                if (!destFilePath.contains(mkPath)) {
                    throw new ApusException("逐一创建目录" + destFilePath + "失败");
                }
                sshSftp.cd(destFilePath);
            }

            BASE64Decoder decoder = new BASE64Decoder();
            try {
                byte[] bytes = decoder.decodeBuffer(imageBase64);
                for (int i = 0; i < bytes.length; ++i) {
                    // 调整异常数据
                    if (bytes[i] < 0) {
                        bytes[i] += 256;
                    }
                }
                sshSftp.put(new ByteArrayInputStream(bytes), fileName);
            } catch (IOException e) {
                throw new ApusException("解析图片信息异常");
            }
            logger.info("SFTP进行文件上传" + fileName + "，上传成功");
        } catch (Exception e) {
            throw new ApusException("SFTP进行文件上传失败，上传文件为：" + fileName, e);
        } finally {
            closeSftpCon(sshSftp, session);
        }
        return afterLoadPath;
    }

    /**
     * 上传文件至sftp服务器
     *
     * @param filePath     本地文件路径
     * @param destFilePath 服务器目标路径
     * @return 文件保存的完全路径
     */
    public static String uploadFile(String filePath, String destFilePath) {
        if (StringUtils.isBlank(destFilePath) || StringUtils.isBlank(filePath)) {
            throw new ApusException("上传的文件来源路径或者目标路径为空");
        }
        DictService dictService = wac.getBean(DictService.class);
        String sftpDoFileDir = dictService.getValue("OSS_PARAM", "SFTP_DO_FILE_DIR", "/uploadFile");
        //由于对于SFTP的根目录权限是root的755，所以默认添加到/uploadFile（默认添加在服务器上的）
        if ("/".equals(destFilePath)) {
            destFilePath = sftpDoFileDir;
        } else {
            destFilePath = sftpDoFileDir + destFilePath;
        }
        Session session = loginSsh();
        ChannelSftp sshSftp = sshSftp(session);
        String afterLoadPath;//文件上传后路径
        String fileName = "";
        //本地目录下获取到本地文件名称
        if (filePath.lastIndexOf("/")!=-1 && filePath.lastIndexOf("\\")==-1) {
            fileName = filePath.substring(filePath.lastIndexOf("/")+1);

        }else if (filePath.lastIndexOf("\\")!=-1 && filePath.lastIndexOf("/")==-1) {
            fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
        }
        //拼接文件上传后路径
        afterLoadPath = destFilePath + "/" + fileName;
        File file = new File(filePath);
        try (FileInputStream inputStream = new FileInputStream(file)) {
            try {
                sshSftp.cd(destFilePath);
            } catch (SftpException e) {
                logger.warn("SFTP工作目录：" + destFilePath + "不存在，正在创建并赋权775");
                String path;
                if (destFilePath.endsWith("/")) {
                    path = destFilePath.substring(1, destFilePath.length() - 1);
                } else {
                    path = destFilePath.substring(1);
                }
                String[] dirs = path.split("/");
                //一层一层，判断没有此层目录则创建
                String mkPath = "";
                for (String current_dir_name : dirs) {
                    try {
                        mkPath = mkPath + "/" + current_dir_name;
                        sshSftp.cd(mkPath);
                    } catch (SftpException ex) {
                        sshSftp.mkdir(mkPath);
                        sshSftp.chmod(Integer.parseInt("775", 8), mkPath);
                        sshSftp.cd(mkPath);
                    }
                }
                if (!destFilePath.contains(mkPath)) {
                    throw new ApusException("逐一创建目录" + destFilePath + "失败");
                }
                sshSftp.cd(destFilePath);
            }

            sshSftp.put(inputStream, file.getName());
            logger.info("SFTP进行文件上传" + fileName + "，上传成功");
        } catch (Exception e) {
            throw new ApusException("SFTP进行文件上传失败，上传文件为：" + fileName, e);
        } finally {
            closeSftpCon(sshSftp, session);
        }
        return afterLoadPath;
    }

    /**
     * 上传图像文件到sftp服务器
     *
     * @param paraMap 上传内容
     * @return 上传文件保存的路径
     */
    public static Map<String, String> uploadImageForBase64(Map<String, String> paraMap) {
        for (Map.Entry<String, String> entry : paraMap.entrySet()) {
            // key组成 akb020_aac001_kcc601_kcc602_kcc603|kcc604
            String key = entry.getKey();
            String imgBase64 = entry.getValue();
            String fileName = key.substring(key.indexOf("|") + 1);
            String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMM"));

            String akb020 = key.substring(0, key.indexOf("_"));

            String afterAkb020 = key.substring(key.indexOf("_") + 1);
            String aac001 = afterAkb020.substring(0, afterAkb020.indexOf("_"));

            String afterAac001 = afterAkb020.substring(afterAkb020.indexOf("_") + 1);
            String afterKcc601 = afterAac001.substring(afterAac001.indexOf("_") + 1);
            String kcc602 = afterKcc601.substring(0, afterKcc601.indexOf("_"));
            String kcc602Type = "";
            switch (kcc602){
                case "0":kcc602Type="dischargeRecords/";break;
                case "1":kcc602Type="checkList/";break;
                case "2":kcc602Type="testSheet/";break;
                default:break;
            }

            String destFilePath = "/" + akb020 + "/" + currentDate + "/" + aac001 + "/" + kcc602Type;
            String sftpPath = uploadImageForBase64(imgBase64, fileName, destFilePath);
            entry.setValue(sftpPath);
        }
        return paraMap;
    }
    /**
     * 删除文件
     *
     * @param filePath 服务器文件完全路径
     */
    public static void deleteFile(String filePath) {
        //删除路径传递为空则不进行操作，抛出异常
        if (StringUtils.isBlank(filePath)) {
            throw new ApusException("删除的文件路径为空");
        }
        //通过ssh登录sftp
        Session session = loginSsh();
        ChannelSftp sshSftp = sshSftp(session);
        try {
            //获取到文件名称和文件存放路径
            String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
            String fileDir = filePath.substring(0, filePath.lastIndexOf("/") + 1);
            sshSftp.cd(fileDir);
            boolean needDel = true;
            try {
                //通过查看文件的真实路径，判断文件是否存在，报错则不存在
                sshSftp.realpath(fileName);
            } catch (Exception e) {
                needDel = false;
                logger.info(fileDir + "目录下，不存在文件" + fileName + ",无法进行删除");
            }
            if (needDel) {
                sshSftp.rm(fileName);
            }
        } catch (Exception e) {
            throw new ApusException("登录SFTP删除文件" + filePath + ",失败", e);
        } finally {
            closeSftpCon(sshSftp, session);
        }
    }

    /**
     * 下载文件
     *
     * @param filePath     保存至本地路径
     * @param destFilePath 服务器文件路径
     * @return 保存至本地完全路径
     */
    public static String downloadFile(String filePath, String destFilePath) {
        if (StringUtils.isBlank(destFilePath) || StringUtils.isBlank(filePath)) {
            throw new ApusException("下载的文件来源路径或者目标路径为空");
        }
        //通过ssh登录sftp
        Session session = loginSsh();
        ChannelSftp sshSftp = sshSftp(session);

        DictService dictService = wac.getBean(DictService.class);
        String sftpDoFileDir = dictService.getValue("OSS_PARAM", "SFTP_DO_FILE_DIR", "/uploadFile");
        try {
            //文件下载后的路径
            //由于对于SFTP的根目录权限是root的755，所以默认添加到/uploadFile（默认添加在服务器上的）
            if (!destFilePath.startsWith(sftpDoFileDir)) {
                destFilePath = sftpDoFileDir + destFilePath;
            }
            //sftp服务器文件地址中获取到文件名称
            String fileName = destFilePath.substring(destFilePath.lastIndexOf("/") + 1);
            //获取sftp服务器文件地址中的目录路径
            String dirPath = destFilePath.substring(0, destFilePath.lastIndexOf("/") + 1);
            sshSftp.cd(dirPath);
            //判断是否有这个文件，没有则不下载
            try {
                sshSftp.realpath(fileName);
            } catch (Exception e) {
                throw new ApusException("下载路径无" + filePath + "文件");
            }

            File file = new File(filePath);
            sshSftp.get(fileName, new FileOutputStream(file));

            return filePath;
        } catch (Exception e) {
            throw new ApusException("通过SFTP下载的文件" + filePath + ",失败", e);
        } finally {
            closeSftpCon(sshSftp, session);
        }
    }

    public static InputStream getFileAsInputStream(String filePath) {
        try {
            URL url = new URL(filePath);
            BufferedInputStream input = new BufferedInputStream(url.openStream());
            return input;
        } catch (Exception e) {
            throw new ApusException("文件流处理异常", e);
        }
    }

    /**
     * SSH登录服务器
     *
     * @return Session
     */
    private static Session loginSsh() {
        DictService dictService = wac.getBean(DictService.class);
        String ip = dictService.getValue("OSS_PARAM", "FTP_IP", "172.18.100.133");
        String psw = dictService.getValue("OSS_PARAM", "FTP_PSWD", "sftp$123");
        String user = dictService.getValue("OSS_PARAM", "FTP_USERNAME", "sftp");
        int port = dictService.getValue_int("OSS_PARAM", "FTP_PORT", 22);

        Session session = null;
        JSch jsch = new JSch();
        try {
            if (port <= 0) {
                // 连接服务器，采用默认端口
                session = jsch.getSession(user, ip);
            } else {
                // 采用指定的端口连接服务器
                session = jsch.getSession(user, ip, port);
            }

            // 如果服务器连接不上，则抛出异常
            if (session == null) {
                throw new ApusException("SSH服务器连接不上,请检查服务器地址与端口是否正确");
            }

            // 设置登陆主机的密码
            session.setPassword(psw);// 设置密码
            // 设置第一次登陆的时候提示，可选值：(ask | yes | no)
            session.setConfig("StrictHostKeyChecking", "no");
            // 设置session登陆超时时间
            session.connect(30000);
            return session;
        } catch (Exception e) {
            //关闭ssh的session连接
            if (session != null) {
                session.disconnect();
            }
            throw new ApusException("SSH服务器登录失败", e);
        }
    }


    /**
     * 登录sftp服务器
     *
     * @return ChannelSftp
     */
    private static ChannelSftp sshSftp(Session session) {
        ChannelSftp channelSftp = null;
        try {
            //获取sftp连接，设置对应参数
            channelSftp = (ChannelSftp) session.openChannel("sftp");
            channelSftp.connect(30000);
            channelSftp.setFilenameEncoding("UTF-8");
            return channelSftp;
        } catch (Exception e) {
            //关闭sftp连接
            if (channelSftp != null) {
                channelSftp.disconnect();
            }
            //关闭ssh的session连接
            session.disconnect();
            throw new ApusException("STP服务器登录失败", e);
        }
    }

    /**
     * 销毁sftp连接
     */
    private static void closeSftpCon(ChannelSftp channelSftp, Session session) {
        try {
            //如果还连接着sftp服务器
            if (channelSftp != null) {
                //从sftp服务器登出
                channelSftp.exit();
            }
        } catch (Exception e) {
            throw new ApusException("注销ftp登录异常，错误信息为：", e);
        } finally {
            if (channelSftp != null && channelSftp.isConnected()) {
                channelSftp.disconnect();
            }
            if (session.isConnected()) {
                session.disconnect();
            }
        }
    }

    /**
     * 下载文件
     *
     * @param destFilePath 服务器文件路径
     * @return 图像的base64字符串格式
     */
    public static String downloadImageForBase64(String destFilePath) {
        String imgBase64Str = "";
        try {
            String tempPath = System.getProperty("java.io.tmpdir") + File.separator + destFilePath.substring(destFilePath.lastIndexOf("/") + 1);
            downloadFile(tempPath, destFilePath);
            File tmpFile = new File(tempPath);
            if (tmpFile.exists()) {
                imgBase64Str = new String(Base64.encodeBase64(FileCopyUtils.copyToByteArray(new FileInputStream(tmpFile))));
                tmpFile.delete();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return imgBase64Str;
    }
}
