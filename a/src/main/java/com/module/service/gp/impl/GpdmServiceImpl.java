package com.module.service.gp.impl;

import org.springframework.stereotype.Service;

import com.module.service.common.impl.BaseServiceImpl;
import com.module.service.gp.GpdmService;


@Service("gpdmService")
public class GpdmServiceImpl extends BaseServiceImpl implements GpdmService {
    
	public void save(Object obj) throws Exception {
		logger.info("gpdmImpl save");
		dao.save("gpdm.save", obj);
	}
	
}
