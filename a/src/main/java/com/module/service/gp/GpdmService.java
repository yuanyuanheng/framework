package com.module.service.gp;

import java.util.List;

import com.module.entity.gp.Gpdm;
import com.module.entity.gp.Limit;

public interface GpdmService {

	public void save(Gpdm obj) throws Exception;
	public List<Gpdm> selectLimit(Limit limit) throws Exception;
}