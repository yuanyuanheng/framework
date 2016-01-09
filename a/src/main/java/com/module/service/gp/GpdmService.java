package com.module.service.gp;

import java.util.List;

import com.module.entity.gp.Gpdm;

public interface GpdmService {

	public void save(Gpdm obj) throws Exception;
	public List<Gpdm> findForList(Object obj) throws Exception;
}