package common;

import junit.framework.TestCase;

public class TestBase extends TestCase{
	public void testLog(){
		Base.log(this.getClass()).info("this is the test log");
		Base.log(this.getClass()).info(Base.userDir);
	}
}
