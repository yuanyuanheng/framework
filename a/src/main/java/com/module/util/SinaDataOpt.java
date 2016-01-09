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
	private  HttpGet httpGet = new HttpGet();
	private  StringBuffer sBufferData = new StringBuffer();
	private  StringBuffer sBufferURI = new StringBuffer();
	private  Map<String,String[]> mapData = new HashMap<String,String[]>();
	
	public  Map<String,String[]> getSinaData(String sSinaGpdm){
		sBufferData.setLength(0);
		sBufferURI.setLength(0);
		mapData.clear();
		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
			httpGet.setURI(URI.create("http://hq.sinajs.cn/list="+sSinaGpdm));
			CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
			HttpEntity entity = httpResponse.getEntity();
			sBufferData.append(EntityUtils.toString(entity));
			sBufferData.deleteCharAt(sBufferData.length()-1);
			String[] arrFirst = DataOpt.splitData(sBufferData.toString(), ";");
			for(String sValue:arrFirst){
				if(sValue.trim().length()<40) continue;
				String[] arrSecond = DataOpt.splitData(DataOpt.subData(sValue,"\"","\""), ",");
				mapData.put(DataOpt.subData(sValue,"_sh","="), arrSecond);
			}
			arrFirst = null;
			sBufferURI.setLength(0);
			sBufferData.setLength(0);
			httpGet.releaseConnection();
			httpClient.close();
			httpResponse.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapData;
	}
	
	public void destroyData(){
		sBufferURI.setLength(0);
		sBufferData.setLength(0);
		sBufferURI = null;
		sBufferData = null;
		httpGet.releaseConnection();
		httpGet = null;
		mapData.clear();
		mapData = null;
	}
}
