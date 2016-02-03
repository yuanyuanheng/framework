package com.mn;

import com.mn.config.Const;
import com.mn.persistent.ParseXml;

import junit.framework.TestCase;

public class ParseXmlTest extends TestCase implements Const{
	
	public void testdbFileParse(){
		
	        new ParseXml().dbFileParse();
	}
}
