package com.util;

import java.rmi.Naming;

import com.module.external.HelloWorld;

import junit.framework.TestCase;

public class RMITest extends TestCase{

	public void testRMIServer() {
		try {
			HelloWorld helloWorld = (HelloWorld) Naming.lookup("rmi://127.0.0.1:6600/HelloWorld");
			HelloWorld hello = (HelloWorld) Naming.lookup("rmi://127.0.0.1:6600/Hello");
			System.out.println(helloWorld.say());
			System.out.println(hello.say());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	
}
