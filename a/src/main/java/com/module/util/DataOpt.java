package com.module.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.module.entity.gp.Dp;
import com.module.entity.gp.Gp;
import com.module.entity.gp.Gpdm;

public class DataOpt {

	public static String[] GP_FIELDNAME = DataOpt.splitData(DataOpt.getFieldName(Gp.class),",");
	public static String[] DP_FIELDNAME = DataOpt.splitData(DataOpt.getFieldName(Dp.class),",");
	public static String[] GPDM_FIELDNAME = DataOpt.splitData(DataOpt.getFieldName(Gpdm.class),",");
	public static List<Gpdm> GPDM_DP= new ArrayList<Gpdm>();
	public static List<Gpdm> GPDM_GP= new ArrayList<Gpdm>();
	
	public static String subData(String strData) {
		return strData.substring(strData.indexOf('"')+1, strData.lastIndexOf('"'));
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
	
	public static Map<String,String> buildMap(String[] arrKey,String[] arrValue){
		int nLoop = CompareArrLen(arrKey,arrValue);
		Map<String,String> mapTemp = new HashMap<String,String>();
		for (int i= 0;i<nLoop;i++){
			mapTemp.put(arrKey[i], arrValue[i]);
		}
		return mapTemp;
	}
	
	
	
}
