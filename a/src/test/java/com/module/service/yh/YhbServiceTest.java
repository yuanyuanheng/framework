package com.module.service.yh;

import javax.annotation.Resource;

import org.junit.Test;

import com.module.common.BaseTest;
import com.module.entity.yh.Yhb;
import com.module.util.UuidUtil;


public class YhbServiceTest extends BaseTest{
	 
	 
	@Resource(name="yhbService")
	YhbService yhbService;
	
	@Test
	public void saveTest() {
	
		Yhb yh = new Yhb(UuidUtil.get32UUID(),"a","b","c","d","e","f","g");
		
		try {
			log.info("测试");
			yhbService.save(yh);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
