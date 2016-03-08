package core;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;

public class HCPool{

	private static PoolingHttpClientConnectionManager mgr = null;
	
	public static CloseableHttpClient getHC(){
		return  HttpClients.custom().setConnectionManager(GetPool()).build();
	}
	
	public static PoolingHttpClientConnectionManager GetPool(){
		if(null == mgr){
			mgr = new PoolingHttpClientConnectionManager();
			mgr.setMaxTotal(200);
			mgr.setDefaultMaxPerRoute(20);
		}
		return mgr;
	}
}
