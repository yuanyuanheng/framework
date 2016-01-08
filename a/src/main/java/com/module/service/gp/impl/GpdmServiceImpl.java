package com.module.service.gp.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.module.entity.gp.Gpdm;
import com.module.service.common.impl.BaseServiceImpl;
import com.module.service.gp.GpdmService;


@Service("gpdmService")
public class GpdmServiceImpl extends BaseServiceImpl implements GpdmService {
    
	public void save(Object obj) throws Exception {
		logger.info("gpdmImpl save");
		dao.save("gpdm.save", obj);
	}
	
	@SuppressWarnings("unchecked")
	public List<Gpdm> findForList(Object obj) throws Exception {
		logger.info("gpdmImpl save");
		return (List<Gpdm>)dao.findForList("gpdm.selectList", obj);
	}
}
