package com.mn.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;

/**
 * 路径工具类
 * 
 * @author
 * 
 */
public class PathUtil {

	
	public static String URLDecode(URL urlSource){
		
		String path = String.valueOf(urlSource.toString().replaceAll("file:/", "").replaceAll("%20", " ").trim());
		if(path.indexOf(":") != 1){
			path = File.separator + path;
		}
		try {
			path = URLDecoder.decode(path, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return path;
	}
	
	
}
