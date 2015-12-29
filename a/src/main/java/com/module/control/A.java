package com.module.control;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class A {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "spring/ApplicationContext.xml"});
		Logger lg =  (Logger) LoggerFactory.getLogger(A.class);
		//lg.debug("aAAA");
		// retrieve configured instance
		Logger log = (Logger) context.getBean("log");
		log.debug("TEEE");
		
	}

}
