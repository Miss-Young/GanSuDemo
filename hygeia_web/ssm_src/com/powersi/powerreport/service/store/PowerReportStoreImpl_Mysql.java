package com.powersi.powerreport.service.store;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.powersi.comm.utils.TimeUtils;
import com.powersi.hygeia.framework.exception.HygeiaException;
import com.powersi.hygeia.framework.util.DAOHelper;
import com.powersi.hygeia.framework.util.DBHelper;
import com.powersi.hygeia.framework.util.UtilFunc;

/**
 * 基于Oracle数据库blob进行报表数据存储
 * @author 李志钢
 *
 */
public class PowerReportStoreImpl_Mysql implements PowerReportStore {

	@Override
	public String store(InputStream ips,String path) {
		//产生报表reportID(UUID) YYYYMM-UUID
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyyMM");
		String dateStr = format.format(date);
		String storeId = dateStr+"-"+UtilFunc.getUUID();
		
		//拼接表名,创建表
		String tableName = "report_data_"+dateStr;
		this.CreateTable(tableName);
		
		//存储报表数据

		DBHelper.update("insert into "+tableName+"(store_id,excel_data) "
				+ "values(?,?)",new Object[] { storeId,ips});
		DBHelper.commit();
	    
		return storeId;
	}

	@Override
	public void get(String store_id, OutputStream ops) {
		Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Blob blob = null;
        InputStream in = null;
        try {
            conn = DBHelper.getConnection();
            String sql = "SELECT excel_data FROM "+getTableName(store_id)+" WHERE store_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, store_id);
            rs = ps.executeQuery();
            
            if(rs.next()) {
                blob = (Blob) rs.getBlob(1);
            }
            in = blob.getBinaryStream();
            
            byte[] buf = new byte[1024];//相当于我们的缓存 
            int bytesIn = 0;//该值用于计算当前实际下载了多少字节 
            while ((bytesIn = in.read(buf, 0, 1024)) != -1) {
            	ops.write(buf, 0, bytesIn);//将b中的数据写到客户端的内存 
            }
            ops.flush(); //将写入到客户端的内存的数据,刷新到磁盘 
            
            conn.commit();//提交
        }catch(Exception e) {
        	try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new HygeiaException("回滚事物出错!",e1);
			}
        	throw new HygeiaException("读取报表数据出错!",e);
        }finally {
            try {
            	if(in != null) {
            		in.close();
            	}
            	if(ops != null) {
            		ops.close();
            	}
                rs.close();
                ps.close();
                conn.close();
            } catch(Exception e) {
            	throw new HygeiaException("关闭链接出错!",e);
            }
        }
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void delte(String store_id) {
		Map param = new HashMap();
		param.put("storeId", store_id);
		
		String table_name = getTableName(store_id);
		DAOHelper.delete(table_name, param, new String[] {"$store_id|storeId" });
		
		//判断表中是否还存在数据，并且不是当前月份的表，则进行drop
		String yyyyMM = TimeUtils.formatDate(new Date(), "yyyyMM");
		if( table_name.indexOf(yyyyMM) == -1) {
			return;
		}
		
		int count = DAOHelper.count(table_name, new HashMap());
		if(count == 0) {
			return;
		} 
		DBHelper.executeCount("drop table "+table_name);
		DBHelper.commit();
	}

	/**
	 * 根据store_id获取表名
	 * @param store_id
	 * @return
	 * String
	 */
	public String getTableName(String store_id) {
		return "report_data_"+store_id.substring(0, store_id.indexOf("-"));
	}
	
	public synchronized void CreateTable(String tableName){
		//判断表是否存在，不存在新增
		if(!DBHelper.existTable(tableName)) {
			StringBuilder sql = new StringBuilder();
			sql.append("create table "+tableName+"  ( ");
			sql.append("	STORE_ID             varchar(50) not null comment '报表ID  YYYYMM-UUID',");
			sql.append("	EXCEL_DATA           longblob comment '存放的带数据的excel',  ");    
			sql.append("	PRINT_CONFIG         longtext comment '打印配置信息，JSON对应PowerPrinterConfigs'  ");    
			sql.append(" )  ");
			DBHelper.executeUpdate(sql.toString());
			
			sql.delete( 0, sql.length() );
			sql.append(" alter table "+tableName+" comment '报表数据存放表模版，实际按月创建，例如："+tableName+"'  ");
			DBHelper.executeUpdate(sql.toString());
		}
	}
}
