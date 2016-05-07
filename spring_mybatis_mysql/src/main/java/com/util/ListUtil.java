package com.util;

import java.util.Iterator;
import java.util.List;

public class ListUtil {
	public static void remove(List<Object> list) {
		for (Iterator<Object> it = list.iterator(); it.hasNext();) {
			it.remove();
		}
	}
}
