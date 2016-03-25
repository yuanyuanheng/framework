package core;

import junit.framework.TestCase;

public class TestHCPool extends TestCase {
	public void testThreadGet() {
		 ThreadGet get = new ThreadGet();
		 get.run();
		 get.start();
	}
	
	public void testThreadParse() {
		ThreadParse parse = new ThreadParse();
		parse.run();
		parse.start();
	}
	
	
}
