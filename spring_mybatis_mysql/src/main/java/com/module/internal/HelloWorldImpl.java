package com.module.internal;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import com.module.external.HelloWorld;

public class HelloWorldImpl extends UnicastRemoteObject implements HelloWorld {
	
	private static final long serialVersionUID = 1L;
	
	public HelloWorldImpl() throws RemoteException {
		super();
		// TODO Auto-generated constructor stub
	}

	public String say() {
		// TODO Auto-generated method stub
		return "hello world!";
	}

}
