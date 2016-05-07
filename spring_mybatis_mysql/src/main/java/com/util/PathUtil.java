package com.util;

import java.io.InputStream;
import java.net.URL;

public class PathUtil {

	public static URL getResoucePath(String name){
		return ClassLoader.getSystemResource(name);
	}
	
	public static InputStream getResouceStream(String name){
		return ClassLoader.getSystemResourceAsStream(name);
	}
}
