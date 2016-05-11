package com.module.external;

import java.rmi.Naming;
import java.rmi.registry.LocateRegistry;

import com.module.internal.HelloWorldImpl;

public class RMIServer {
	public void start(){
		try {
			HelloWorld helloWorld = new HelloWorldImpl();
			LocateRegistry.createRegistry(6600);
			Naming.bind("rmi://127.0.0.1:6600/HelloWorld", helloWorld);
			Naming.bind("rmi://127.0.0.1:6600/Hello", helloWorld);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args){
		new RMIServer().start();
	}
}
