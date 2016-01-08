package com.module.util;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SinaDataOpt{
	public static Logger log = LoggerFactory.getLogger(SinaDataOpt.class);
	private static CloseableHttpClient httpClient = HttpClients.createDefault();
	private static HttpGet httpGet = new HttpGet();
	private static StringBuffer sBufferData = new StringBuffer();
	private static Map<Integer,String[]> mapData = new HashMap<Integer,String[]>();
	private static StringBuffer sBufferURI = new StringBuffer();
	
	public static Map<Integer,String[]> getSinaData(String sSinaGpdm){
		sBufferData.setLength(0);
		sBufferURI.setLength(0);
		mapData.clear();
		try {
			httpGet.setURI(URI.create("http://hq.sinajs.cn/list="+sSinaGpdm));
			log.debug(httpGet.getURI().toString());
			CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
			HttpEntity entity = httpResponse.getEntity();
			sBufferData.append(EntityUtils.toString(entity));
			sBufferData.deleteCharAt(sBufferData.length()-1);
			log.info(sBufferData.toString());
			String[] arrFirst = DataOpt.splitData(sBufferData.toString(), ";");
			for(String sValue:arrFirst){
				if(sValue.trim().equals("")) continue;
				sValue = DataOpt.subData(sValue);
				sValue = UuidUtil.get32UUID() + "," + sValue;
				String[] arrSecond = DataOpt.splitData(sValue, ",");
				mapData.put(mapData.size(), arrSecond);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapData;
	}
}
