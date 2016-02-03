package com.mn;

import com.mn.config.Const;

import junit.framework.TestCase;

public class ConstTest extends TestCase implements Const{
	
	public void testLog(){
		
	        LOG.finest("finest");
	        LOG.finer("finer");
	        LOG.fine("fine");
	        LOG.info("info");
	        LOG.config("config");
	        LOG.warning("warning");
	        LOG.severe("severe");
	}
}
