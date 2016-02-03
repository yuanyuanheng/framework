package com.mn.config;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.mn.util.LoggerManage;
import com.mn.util.PathUtil;

public interface Const {
	public static String PERSISTENT_CONFIG_RESOURCE = "persistent.xml";//数据存储配置文件
	public static String LOG_CONFIG_RESOURCE = "log_zh_cn.properties";//数据存储配置文件
	public static String CURR_PATH = PathUtil.URLDecode(Const.class.getResource(""));//Const当前路径
	public static Logger LOG = LoggerManage.getLogger(Const.class,LOG_CONFIG_RESOURCE,Level.ALL);//资源文件放在根目录下
	
}

