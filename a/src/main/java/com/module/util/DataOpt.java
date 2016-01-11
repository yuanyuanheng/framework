package com.module.util;

import java.lang.reflect.Field;
import java.util.Map;

import com.module.entity.gp.Dp;
import com.module.entity.gp.Gp;

public class DataOpt {
	
	public static String[] GP_FIELDNAME = splitData(getFieldName(Gp.class),",");
	public static String[] DP_FIELDNAME = splitData(getFieldName(Dp.class),",");
	
	public static String subData(String sData,String sBegin,String sEnd) {
		return sData.substring(sData.indexOf(sBegin)+sBegin.length(), sData.lastIndexOf(sEnd));
	}

	public static String[] splitData(String str,String sFlag) {
		return str.split(sFlag);
	}

	public static int CompareArrLen(String[] arrFirst, String[] arrSecond) {
		return arrFirst.length < arrSecond.length ? arrFirst.length : arrSecond.length;
	}
	
	public static String getFieldName(Class<?> clsTemp){
		Field[] arrField = clsTemp.getDeclaredFields();
		StringBuilder sBuilder = new StringBuilder();
		for(Field f:arrField){
			sBuilder.append(f.getName());
			sBuilder.append(",");
		}
		sBuilder.deleteCharAt(sBuilder.length()-1);
		return sBuilder.toString();
	}
	
	public static Map<String,String> buildMap(String[] arrKey,String[] arrValue,Map<String,String> mapTemp){
		int nLoop = CompareArrLen(arrKey,arrValue);
		for (int i= 0;i<nLoop;i++){
			mapTemp.put(arrKey[i], arrValue[i]);
		}
		return mapTemp;
	}
}
