package common;

import junit.framework.TestCase;

public class BaseTest extends TestCase implements Base{
	public void testLog(){
		log.info("this is the test log");
	}
}
