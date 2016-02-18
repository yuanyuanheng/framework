package com.mn;

import com.mn.config.Const;
import com.mn.config.Init;

import junit.framework.TestCase;

public class InitTest extends TestCase implements Const{
	
	public void testInitMysqlTable(){
		Init.initMysqlTable();
	
	}
}
