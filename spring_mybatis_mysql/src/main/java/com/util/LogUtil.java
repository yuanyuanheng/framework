package com.util;

public class LogUtil {
	private static FileUtil fileUtil;
	
	private static String logDir = PropertiesUtil.getValue("logDir", "system.properties");
	private static String logName = PropertiesUtil.getValue("logName", "system.properties");
	
	public static void write(String log, Class<?> clsName){
		logName = DateUtil.getDay()+"."+logName;
		if(null == fileUtil){
			fileUtil = new FileUtil(logDir, logName);
		}
		log = DateUtil.getTime()+"\t"+clsName.getName() + "\t" +log+"\n";
		fileUtil.WriteExist(log);
	}
	
	public static void setLogName(String str){
		logName = str;
		fileUtil = null;
	}
}
