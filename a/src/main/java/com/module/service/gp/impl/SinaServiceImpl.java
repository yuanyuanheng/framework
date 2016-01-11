package com.module.service.gp.impl;

import org.springframework.stereotype.Service;

import com.module.service.common.impl.BaseServiceImpl;
import com.module.service.gp.SinaService;


@Service("sinaService")
public class SinaServiceImpl extends BaseServiceImpl implements SinaService {
    
	public void save(Object obj) throws Exception {
		dao.save("sina.save", obj);
	}
	
}
