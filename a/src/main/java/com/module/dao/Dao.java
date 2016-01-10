package com.module.dao;

import java.util.List;

public interface Dao {

	public Object save(String str, Object obj) throws Exception;

	public Object batchSave(String str, List<Object> objs) throws Exception;

	public Object update(String str, Object obj) throws Exception;

	public Object delete(String str, Object obj) throws Exception;

	public Object findForObject(String str, Object obj) throws Exception;

	public Object findForList(String str, Object obj) throws Exception;

	public Object findForMap(String sql, Object obj, String key) throws Exception;

}
