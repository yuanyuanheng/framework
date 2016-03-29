package com.module.external;

import javax.jws.WebService;

@WebService(endpointInterface = "com.module.external.Test")
public class TestImpl implements Test {

	public String get() {
		// TODO Auto-generated method stub
		return ("this is the test");
	}

}
