package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	private final static SimpleDateFormat Day = new SimpleDateFormat("yyyy-MM-dd");

	private final static SimpleDateFormat Days = new SimpleDateFormat("yyyyMMdd");

	private final static SimpleDateFormat Time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


	public static String getDay() {
		return Day.format(new Date());
	}


	public static String getDays() {
		return Days.format(new Date());
	}

	public static String getTime() {
		return Time.format(new Date());
	}
	
	public static String getTime(Date dt) {
		return Time.format(dt);
	}

}
