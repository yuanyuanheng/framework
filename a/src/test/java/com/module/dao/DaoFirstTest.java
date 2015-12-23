package com.module.dao;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class DaoFirstTest {

	@Test
	public void testFirst() {
		// TODO Auto-generated method stub
		DaoFirst mv = new DaoFirst();
		String sRet = mv.first();
		assertEquals("first test maven",sRet);
		System.out.println(sRet+"ddd");
	}

}
