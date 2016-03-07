package core;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;

import common.Base;
import junit.framework.TestCase;

public class TestHCPool extends TestCase implements Base{
	public void testGetThread(){
		CloseableHttpClient hc = HCPool.getHC();
		HttpGet hg = new HttpGet("http://tieba.baidu.com/f?ie=utf-8&kw=%E7%8F%A0%E6%B5%B7&fr=search");
		GetThread thread = new GetThread(hc,hg);
		thread.start();
		try {
			thread.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e.getMessage());
		}
	}
}
