package common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mysql.Mysql;

public abstract class Base {
	
	public static Mysql m_mysql = initMysql();
	public static SqlSessionFactory m_sqlSessionFactory = initSqlSessionFactory();
	
	public static String m_userDir = System.getProperty("user.dir");
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
	
	private static SqlSessionFactory initSqlSessionFactory(){
		if(null == m_sqlSessionFactory){
			String resource = "mybatis/mybatis-config.xml";
			try {
				InputStream inputStream = Resources.getResourceAsStream(resource);
				m_sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return m_sqlSessionFactory;
	}
	
}
