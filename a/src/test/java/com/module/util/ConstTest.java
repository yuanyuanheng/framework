package com.module.util;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;

public class ConstTest {
	
	@Test
	public void staticTest(){
		final Logger log = LogManager.getLogger(Const.class);
		log.debug("输出debug");
		
	}
}
