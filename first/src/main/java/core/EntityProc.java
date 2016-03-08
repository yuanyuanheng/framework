package core;

import org.apache.commons.codec.binary.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;

import common.Base;
import mysql.MysqlOpt;

public class EntityProc {
	public EntityProc(String sUrl, HttpEntity entity) {
		try {
			String sSql = String.format("insert into Original(map_key,map_value) values('%s','%s')", sUrl,
			 (EntityUtils.toByteArray(entity)));
			MysqlOpt mysqlOpt = new MysqlOpt();
			mysqlOpt.start();
			mysqlOpt.update(sSql);
			mysqlOpt.end();
		} catch (Exception e) { 
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getCause());
		}
	}
}
