package com.module.task;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.module.entity.gp.Gpdm;
import com.module.service.gp.GpService;
import com.module.service.gp.GpdmService;
import com.module.util.SinaDataOpt;

@Component
public class DataPullTask {
	public Logger log = LoggerFactory.getLogger(DataPullTask.class);
	@Resource(name = "gpService")
	GpService gpService;

	@Resource(name = "gpdmService")
	GpdmService gpdmService;

	// @Scheduled(fixedRate = 5000)
	/*
	 * public void getGPData(String sList) { try { // String sList =
	 * "sh600000,sh600004"; Map<Integer, String[]> mapData =
	 * SinaDataOpt.getSinaData(sList); for (int i = 0; i < mapData.size(); i++)
	 * { Map<String, String> mapGp = DataOpt.buildMap(DataOpt.GP_FIELDNAME,
	 * mapData.get(i)); gpService.save(mapGp); } } catch
	 * (ClientProtocolException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (Exception e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); }
	 * 
	 * }
	 */

	@Scheduled(fixedRate = 500000)
	public void flushGpdmFirst() {
		flushGpdm(0, 100001);
	}

	@Scheduled(fixedRate = 500000)
	public void flushGpdmSecond() {
		flushGpdm(100001, 200001);
	}

	public void flushGpdm(int nbegin, int nLen) {
		StringBuffer sBuffer = new StringBuffer();
		SinaDataOpt sinaDataOpt = new SinaDataOpt();
		for (int i = nbegin; i < nLen; i++) {
			String sGpdm = "00000" + i;
			sGpdm = sGpdm.substring(sGpdm.length() - 6, sGpdm.length());
			sBuffer.append("sh" + sGpdm + ",");
			if (i % 50 == 0) {
				sBuffer.append("sh" + sGpdm);
				log.debug(sBuffer.toString());
				Map<String, String[]> mapData = sinaDataOpt.getSinaData(sBuffer.toString());
				save(mapData);
				sBuffer.setLength(0);
				mapData = null;
			}
		}
		sinaDataOpt.destroyData();
		sBuffer = null;
		sinaDataOpt = null;
	}

	private void save(Map<String, String[]> mapData) {

		for (Map.Entry<String, String[]> entry : mapData.entrySet()) {
			Gpdm clsGpdm = new Gpdm();
			clsGpdm.setGpdm(entry.getKey());
			clsGpdm.setGpmc(entry.getValue()[0]);
			try {
				gpdmService.save(clsGpdm);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
