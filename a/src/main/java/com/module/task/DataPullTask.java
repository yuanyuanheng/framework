package com.module.task;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.module.service.gp.GpService;
import com.module.util.DataOpt;
import com.module.util.SinaDataOpt;

@Component
public class DataPullTask {
	public Logger log = LoggerFactory.getLogger(DataPullTask.class);
	@Resource(name="gpService")
	GpService gpService;
	
	@Scheduled(fixedRate = 5000)
	public void getGPData(){
		try {
			String sList = "sh600000,sh600004";
			Map<Integer,String[]> mapData = SinaDataOpt.getSinaData(sList);
			for(int i=0;i<mapData.size();i++){
				Map<String,String> mapGp = DataOpt.buildMap(DataOpt.GP_FIELDNAME,mapData.get(i));
				gpService.save(mapGp);
			}
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	@Scheduled(fixedRate = 5000)
	public void flushGpdm(){
		
	}
	
}
