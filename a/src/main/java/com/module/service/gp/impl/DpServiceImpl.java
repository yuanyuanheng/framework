package com.module.service.gp.impl;

import org.springframework.stereotype.Service;

import com.module.service.common.impl.BaseServiceImpl;
import com.module.service.gp.DpService;


@Service("dpService")
public class DpServiceImpl extends BaseServiceImpl implements DpService {
    
	public void save(Object obj) throws Exception {
		logger.info("dpImpl save");
		dao.save("dp.save", obj);
	}
	
}
