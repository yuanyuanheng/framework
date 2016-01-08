package com.module.util;

import org.junit.Test;


public class TestSplit {
	@Test
	public void flushGpdm() {
		StringBuffer sBuffer = new StringBuffer();
		for(int i=1; i<999999; i++){
			String str = "00000"+i;
			str = str.substring(str.length()-6, str.length());
			sBuffer.append("sh"+str+",");
		}
		sBuffer.append("sh999999");
		//System.out.println(sBuffer.toString());
	}
}
