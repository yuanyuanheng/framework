package com.module.service.common.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.module.dao.Dao;
import com.module.service.common.BaseService;
import com.sd.ubarchive.util.UuidUtil;

public class BaseServiceImpl implements BaseService{
    
	public Logger logger=LoggerFactory.getLogger(BaseServiceImpl.class);
    
	@Resource
	protected Dao dao;

	public Object save(String str, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return dao.save(str, obj);
	}

	public Object update(String str, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object delete(String str, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findForObject(String str, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findForList(String str, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findForMap(String sql, Object obj, String key, String value) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findForList(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public static String get32UUID(){
		return UuidUtil.get32UUID();
	}
}
