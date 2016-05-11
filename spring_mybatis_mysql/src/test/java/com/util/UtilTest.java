package com.util;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import junit.framework.TestCase;

public class UtilTest extends TestCase{

	public void testGet32UUID() {
		System.out.println(UuidUtil.get32UUID());
	}
	
	public void testGetResoucePath(){
		System.out.println(PathUtil.getResoucePath("spring-mvc.xml"));
	}
	
	public void testGetValue(){
		Map<String, String> keyMap = new HashMap<String, String>();
		keyMap.put("logDir", "");
		keyMap.put("logDi", "");
		PropertiesUtil.getValue(keyMap, "system.properties");
		for(Map.Entry<String, String> entry:keyMap.entrySet()){
			System.out.println(entry.toString());
		}
		String value = PropertiesUtil.getValue("logDir", "system.properties");
		System.out.println(value);
	}
	
	public void  testlogUtil(){
		LogUtil.write("这是测试日志", this.getClass());
		LogUtil.setLogName("test");
		LogUtil.write("这是测试日志test1", this.getClass());
		LogUtil.write("这是测试日志test2", this.getClass());
	}
	
	public void  testDt(){
		Date dt = new Date(1462921583);
		System.out.println(DateUtil.getTime(dt));
	}
}
