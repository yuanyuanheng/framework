package com.module.service.gp;

import javax.annotation.Resource;

import org.junit.Test;

import com.module.common.BaseTest;
import com.module.entity.gp.Dp;
import com.module.util.UuidUtil;


public class DpServiceTest extends BaseTest{
	 
	 
	@Resource(name="dpService")
	DpService dpService;
	
	@Test
	public void saveTest() {
	
		Dp dp = new Dp();
		dp.setDpid(UuidUtil.get32UUID());
		try {
			log.info("测试");
			dpService.save(dp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
