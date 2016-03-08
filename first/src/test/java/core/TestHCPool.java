package core;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;

import common.Base;
import junit.framework.TestCase;

public class TestHCPool extends TestCase{
	public void testGetThread(){
		CloseableHttpClient hc = HCPool.getHC();
		HttpGet hg = new HttpGet("http://blog.csdn.net/lonely_fireworks/article/details/7962171");
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
