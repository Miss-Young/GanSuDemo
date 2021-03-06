package com.powersi.hygeia.comm.license.service;

import com.powersi.comm.service.memory.MemoryDBWrapper;
import com.powersi.webservice.WebServiceRequestParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

//import com.powersi.pcloud.dict.service.DictService;

/**
 * 运行许可证检查服务
 * 
 * @author 李志钢
 *
 */
@Service
public class LicenseCheckService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	@Qualifier("memoryDBWrapper_core")
	private MemoryDBWrapper memoryDBWrapper;
//	@Autowired
//	private DictService dictService;

	/**
	 * 检查许可证合法性
	 * 
	 * @param moduleID
	 *            功能模块编号 1=通过web访问hygeia 2=通过api访问hygeia
	 * @param acc_code
	 *            账户编号
	 */
	@SuppressWarnings("unchecked")
	public void checkLicense(int moduleID, String acc_code, WebServiceRequestParam request) {
		// TS18122500127_RQ18122513545_刘勇_强制启用许可证管理
//		// 读取字典，判断是否需要检查许可证，默认值为1，表示检查许可证，值为0则不检查
////		int checkflag = dictService.getValue_int("LICENSE_PARAM", "LICENSE_CHECK_FLAG", 1);
////		if (checkflag != 1) {
////			return;
////		}
//		// 从redis读取对应单位的Liscense字符串
//		// lzg 20170304 统一账户全部大写
//		String key = acc_code.toUpperCase();// acc_code.toLowerCase();
//		String license = (String) memoryDBWrapper.getMemoryDB().getMapValue("MAP_LICENSE", key);
//		if (StringUtils.isBlank(license)) {
//			throw new ApusException("此医疗机构没有许可证，请联系厂家获取支持！联系电话：400-602-0109!");
//		}
//		// 赋值LicenseBean
//		LicenseBean licenseBean = new LicenseBean();
//		licenseBean.setsLicense(license);
//		// 2018-11-21 huangyao 将许可证中的终端限制数，放到入参中进行传递
//		if (request != null) {
//			request.put("limit_terminal_number", String.valueOf(licenseBean.getLimit_terminal_number()));
//			request.put("crowdcontrolidentity", licenseBean.getCrowdcontrolidentity());
//		}
//		String gnState = licenseBean.getGndmByModuleID(moduleID); // 得到功能状态
//		if ("2".equals(gnState)) {
//			return; // 2表示可以无条件使用该功能
//		}
//		if (!"1".equals(gnState)) {
//			throw new ApusException("根据您的许可证配置，您不允许访问当前功能，请联系厂家获取支持！联系电话：400-602-0109!");
//		}
//		// 检查，如果过期，抛出HygeiaException 此医疗机构为尚未启用，请联系厂家获取支持！联系电话：400-602-0109!
//		// 如果即将过期 20天内过期，抛出LicenseWarnException
//		// 贵单位医疗保险管理系统客户端使用协议将在XX天后到期，请及时联系创智和宇400-602-0109解决
//		Date date = new Date();
//		Date endData = licenseBean.getEndDate();
//		int day = daysBetween(date, endData);
//		if (day <= 0) {
//			throw new ApusException("此医疗机构许可证已过期，请联系厂家获取支持！联系电话：400-602-0109!");
//		} else if (day <= 20) {
//			throw new LicenseWarnException("贵单位医疗保险管理系统客户端使用协议将在" + day + "天后到期，请及时联系创智和宇400-602-0109解决");
//		}
	}

	/**
	 * 计算两个日期之间相差的天数
	 * 
	 * @param smdate
	 * @param bdate
	 * @return
	 */
	private int daysBetween(Date smdate, Date bdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			smdate = sdf.parse(sdf.format(smdate));
			bdate = sdf.parse(sdf.format(bdate));
		} catch (Exception e) {
			logger.error("日期转换异常:" + e.getMessage(), e);
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);
		return Integer.parseInt(String.valueOf(between_days));
	}

}
