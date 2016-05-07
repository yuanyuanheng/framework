package com.util;

public class StringUtil {
	
	public static boolean notEmpty(String s){
		return s!=null && !"".equals(s) && !"null".equals(s);
	}
	
	public static boolean isEmpty(String s){
		return s==null || "".equals(s) || "null".equals(s);
	}
}
