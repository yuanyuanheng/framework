package com.module.control;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import ch.qos.logback.ext.spring.ApplicationContextHolder;

public class A {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "services.xml"});
		Logger lg =  (Logger) LoggerFactory.getLogger("A");
		lg.debug("aAAA");
		// retrieve configured instance
		ApplicationContextHolder log = (ApplicationContextHolder) context.getBean("log");
	}

}
