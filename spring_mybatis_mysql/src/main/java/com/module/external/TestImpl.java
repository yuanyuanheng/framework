package com.module.external;

import org.springframework.stereotype.Component;

@Component("TestImpl")
public class TestImpl implements Test {

	public String get() {
		// TODO Auto-generated method stub
		return ("this is the test");
	}

}
