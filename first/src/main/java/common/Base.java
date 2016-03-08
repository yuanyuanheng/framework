package common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import mysql.Mysql;

public abstract class Base {
	
	public static Mysql m_mysql = initMysql();
	
	public static Log log(Class<?> cls){
		return LogFactory.getLog(cls);
	} 
	
	private static Mysql initMysql() {
		if (null == m_mysql) {
			m_mysql = new Mysql();
			m_mysql.setM_sDriverClassName("com.mysql.jdbc.Driver");
			m_mysql.setM_sUrl("jdbc:mysql://127.0.0.1:3306/first?useUnicode=yes&amp;characterEncoding=UTF8");
			m_mysql.setM_sUserName("root");
			m_mysql.setM_sPassword("root");
		}
		return m_mysql;
	}
}
