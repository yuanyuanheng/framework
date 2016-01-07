package com.module.util;

public class DataOperate {

	public static String[] getStrArray(String str) {
		str = str.substring(str.indexOf("=")+1,str.length()-2);
		String[] strArray = str.split(",");
		return strArray;
	}
	
}

