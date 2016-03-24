package core;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.protocol.HttpContext;

import common.Base;
import entity.OriginalProc;

public class GetThread extends Thread{
	private final CloseableHttpClient httpClient;
	private final HttpContext context;
	private final HttpGet httpget;
	private String m_sKeyOld;
	private String m_sValue;
	
	public GetThread(CloseableHttpClient httpClient, HttpGet httpget, String sKeyOld, String sValue) {
		this.httpClient = httpClient;
		this.context = HttpClientContext.create();
		this.httpget = httpget;
		this.m_sKeyOld = sKeyOld;
		this.m_sValue = sValue;
	}

	@Override
	public void run() {
		try {
			CloseableHttpResponse response = httpClient.execute(httpget, context);
			try {
				HttpEntity entity = response.getEntity();
				/*OriginalProc objOriginalProc = new OriginalProc(httpget.getURI().toString(),entity,m_sKeyOld,m_sValue);
				objOriginalProc.save();*/
			} finally {
				response.close();
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		}
	}

}
