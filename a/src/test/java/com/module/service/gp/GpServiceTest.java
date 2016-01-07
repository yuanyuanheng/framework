package com.module.service.gp;

import javax.annotation.Resource;

import org.junit.Test;

import com.module.common.BaseTest;
import com.module.entity.gp.Gp;
import com.module.util.UuidUtil;


public class GpServiceTest extends BaseTest{
	 
	 
	@Resource(name="gpService")
	GpService gpService;
	
	@Test
	public void saveTest() {
	
		Gp gp = new Gp();
		gp.setGpid(UuidUtil.get32UUID());
		try {
			log.info("测试");
			gpService.save(gp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
