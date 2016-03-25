package common;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mysql.Mysql;

public abstract class Base {
	
	public static Mysql mysql = initMysql();
	public static SqlSessionFactory sqlSessionFactory = initSqlSessionFactory();
	public static String userDir = System.getProperty("user.dir");
	public static String tempDir = String.format("%s%s%s", userDir, File.separator, "temp");
	public static Log log(Class<?> cls){
		return LogFactory.getLog(cls);
	} 
	
	private static Mysql initMysql() {
		if (null == mysql) {
			mysql = new Mysql();
			mysql.setsDriverClassName("com.mysql.jdbc.Driver");
			mysql.setsUrl("jdbc:mysql://127.0.0.1:3306/first?useUnicode=yes&amp;characterEncoding=UTF8");
			mysql.setsUserName("root");
			mysql.setsPassword("root");
		}
		return mysql;
	}
	
	private static SqlSessionFactory initSqlSessionFactory(){
		if(null == sqlSessionFactory){
			String resource = "mybatis/mybatis-config.xml";
			try {
				InputStream inputStream = Resources.getResourceAsStream(resource);
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sqlSessionFactory;
	}
	
	public static String getUUID(){
		return UUID.randomUUID().toString().trim().replaceAll("-", "");
	}
	
}
