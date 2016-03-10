package core;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;

import common.Base;
import junit.framework.TestCase;

public class TestHCPool extends TestCase {
	public void testGetThread() {
		CloseableHttpClient hc = HCPool.getHC();
		HttpGet hg = new HttpGet("http://tieba.baidu.com/f?kw=%E7%8F%A0%E6%B5%B7&ie=utf-8");
		GetThread thread = new GetThread(hc, hg , "-1","珠海贴吧");
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
