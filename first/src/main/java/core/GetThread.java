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

public class GetThread extends Thread{
	private final CloseableHttpClient httpClient;
	private final HttpContext context;
	private final HttpGet httpget;

	public GetThread(CloseableHttpClient httpClient, HttpGet httpget) {
		this.httpClient = httpClient;
		this.context = HttpClientContext.create();
		this.httpget = httpget;
	}

	@Override
	public void run() {
		try {
			CloseableHttpResponse response = httpClient.execute(httpget, context);
			try {
				HttpEntity entity = response.getEntity();
				new EntityProc(httpget.getURI().toString(),entity);
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
