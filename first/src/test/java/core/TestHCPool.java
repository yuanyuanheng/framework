package core;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;

import common.Base;
import junit.framework.TestCase;

public class TestHCPool extends TestCase{
	public void testGetThread(){
		CloseableHttpClient hc = HCPool.getHC();
		HttpGet hg = new HttpGet("http://my.oschina.net/u/1024767/blog/178960");
		GetThread thread = new GetThread(hc,hg);
		thread.start();
		try {
			thread.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getCause());
		}
	}
}
