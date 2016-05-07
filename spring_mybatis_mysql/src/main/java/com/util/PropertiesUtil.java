package com.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;

public class PropertiesUtil {

	public static void getValue(Map<String, String> keyMap, String name) {
		for (Map.Entry<String, String> entry : keyMap.entrySet()) {
			String key = entry.getKey();
			String value = getProperties(name).getProperty(key);
			entry.setValue(value);
		}
	}

	public static String getValue(String key, String name) {
		return getProperties(name).getProperty(key);
	}

	public static Properties getProperties(String name) {
		InputStream inStream = PathUtil.getResouceStream(name);
		Properties properties = new Properties();
		try {
			properties.load(inStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return properties;
	}
}
