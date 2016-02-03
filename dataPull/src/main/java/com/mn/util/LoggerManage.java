package com.mn.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.LogManager;
import java.util.logging.Logger;

public class LoggerManage {
	
	private LoggerManage(Class<?> clsTemp,String resourcePath){
		InputStream is = clsTemp.getResourceAsStream(resourcePath);
		try {
			LogManager.getLogManager().readConfiguration(is);
			is.close();
			is = null;
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public static Logger getLogger(Class<?> clsTemp,String resourcePath,Level logLevel){
		if(null == loggerManage){
			loggerManage = new LoggerManage(clsTemp,resourcePath);
		}
		Logger logger = Logger.getLogger(clsTemp.getName());
		logger.setLevel(logLevel);
		return logger;
	}
	
	private static LoggerManage loggerManage;
}
