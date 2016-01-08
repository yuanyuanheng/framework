package com.module.task;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.module.service.gp.GpService;
import com.module.service.gp.GpdmService;
import com.module.util.DataOpt;
import com.module.util.SinaDataOpt;

@Component
public class DataPullTask {
	public Logger log = LoggerFactory.getLogger(DataPullTask.class);
	@Resource(name = "gpService")
	GpService gpService;

	@Resource(name = "gpdmService")
	GpdmService gpdmService;

	// @Scheduled(fixedRate = 5000)
	public void getGPData(String sList) {
		try {
			// String sList = "sh600000,sh600004";
			Map<Integer, String[]> mapData = SinaDataOpt.getSinaData(sList);
			for (int i = 0; i < mapData.size(); i++) {
				Map<String, String> mapGp = DataOpt.buildMap(DataOpt.GP_FIELDNAME, mapData.get(i));
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

	@Scheduled(fixedRate = 50000)
	public void flushGpdm() {
		StringBuffer sBuffer = new StringBuffer();
		for (int i = 1; i < 1000001; i++) {
			String str = "00000" + i;
			str = str.substring(str.length() - 6, str.length());
			sBuffer.append("sh" + str + ",");
			if(i%50==0){
				sBuffer.append("sh" + str);
				log.debug(sBuffer.toString());
				Map<Integer, String[]> mapData = SinaDataOpt.getSinaData(sBuffer.toString());
				for (int j = 0; j < mapData.size(); j++) {
					if(mapData.get(j).length > 2){
						log.debug(mapData.get(j)[1]);
					}
				}
				sBuffer.setLength(0);
			}
		}
		
	}

}
