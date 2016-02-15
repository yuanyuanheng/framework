package com.mn.config;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.mn.bean.Mysql;

public class Init {

	private static Mysql m_mysql;

	public static Mysql initMysql() {
		if (null == m_mysql) {
			m_mysql = new Mysql();
			m_mysql.setM_sDriverClassName("com.mysql.jdbc.Driver");
			m_mysql.setM_sUrl("jdbc:mysql://127.0.0.1:3306/mn?useUnicode=yes&amp;characterEncoding=UTF8");
			m_mysql.setM_sUserName("sdsj");
			m_mysql.setM_sPassword("sdsj");
		}
		return m_mysql;
	}
	
	
	private static Logger m_logger;
	public static Logger initLogger(Class<?> clsTemp,String filePath,Level logLevel){
		if(null == m_logger){
			System.setProperty("java.util.logging.config.file", filePath);
		}
		m_logger = Logger.getLogger(clsTemp.getName());
		m_logger.setLevel(logLevel);
		return m_logger;
	}
	
	public void initTable(){
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("");
	}

}
