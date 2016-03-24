package core;

import org.apache.http.HttpEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.util.EntityUtils;

import common.Base;
import common.ConvertHex;
import mysql.MysqlOpt;
import status.CaptureStatus;

public class EntityProc {
	public EntityProc(String sUrl, HttpEntity entity) {
		try {
			String sContent = ConvertHex.toString(EntityUtils.toByteArray(entity));
			String sContentType = ContentType.getOrDefault(entity).getCharset().name();
			String sSql = String.format("insert into Original(map_key,map_value,value_type,status) values('%s','%s','%s',%d)",
					sUrl, sContent, sContentType, CaptureStatus.NO.getnIndex());
			MysqlOpt mysqlOpt = new MysqlOpt();
			mysqlOpt.start();
			mysqlOpt.update(sSql);
			mysqlOpt.end();
		} catch (Exception e) { 
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		}
	}
	
}
