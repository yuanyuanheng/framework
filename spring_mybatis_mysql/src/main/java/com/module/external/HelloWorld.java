package com.module.external;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface HelloWorld extends Remote{
	public String say() throws RemoteException;
}
