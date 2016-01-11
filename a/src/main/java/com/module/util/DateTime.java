package com.module.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DateTime {
	private static Date date = new Date();
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static String ToString(){
		return sdf.format(date);
	}
}
