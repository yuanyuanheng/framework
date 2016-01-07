package com.module.service.gp.impl;

import org.springframework.stereotype.Service;

import com.module.service.common.impl.BaseServiceImpl;
import com.module.service.gp.GpService;


@Service("gpService")
public class GpServiceImpl extends BaseServiceImpl implements GpService {
    
	public void save(Object obj) throws Exception {
		logger.info("gpImpl save");
		dao.save("gp.save", obj);
	}
	
}
