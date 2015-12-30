package com.module.service.yh.impl;

import org.springframework.stereotype.Service;

import com.module.service.common.impl.BaseServiceImpl;
import com.module.service.yh.YhbService;


@Service("yhbImpl")
public class YhbServiceImpl extends BaseServiceImpl implements YhbService {
    
	/***
	 * 保存用户信息
	 * @param obj
	 * @throws Exception
	 */
	public void save(Object obj) throws Exception {
		logger.info("YhbImpl save");
		dao.save("yhb.save", obj);
	}
	
}
