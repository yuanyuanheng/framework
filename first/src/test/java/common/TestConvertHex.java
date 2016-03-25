package common;

import junit.framework.TestCase;

public class TestConvertHex extends TestCase{
	public void testToString(){
		String sTest = ConvertHex.toString(new String("https://www.hao123.com/").getBytes());
		Base.log(this.getClass()).info(sTest);
		Base.log(this.getClass()).info(Base.getUUID());
	}
}
