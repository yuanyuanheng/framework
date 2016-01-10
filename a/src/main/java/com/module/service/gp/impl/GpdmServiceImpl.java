package com.module.service.gp.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.module.entity.gp.Gpdm;
import com.module.entity.gp.Limit;
import com.module.service.common.impl.BaseServiceImpl;
import com.module.service.gp.GpdmService;


@Service("gpdmService")
public class GpdmServiceImpl extends BaseServiceImpl implements GpdmService {
    
	public void save(Gpdm gpdm) throws Exception {
		dao.save("gpdm.save", gpdm);
	}
	
	@SuppressWarnings("unchecked")
	public List<Gpdm> selectLimit(Limit limit) throws Exception{
		return (List<Gpdm>)dao.findForList("gpdm.listLimit", limit);
	}
	
}