package com.module.task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.module.entity.gp.Gpdm;
import com.module.entity.gp.Limit;
import com.module.service.gp.DpService;
import com.module.service.gp.GpService;
import com.module.service.gp.GpdmService;
import com.module.util.DataOpt;
import com.module.util.SinaDataOpt;

@Component
public class DataPullTask {
	public Logger log = LoggerFactory.getLogger(DataPullTask.class);
	@Resource(name = "gpService")
	GpService gpService;

	@Resource(name = "dpService")
	DpService dpService;

	@Resource(name = "gpdmService")
	GpdmService gpdmService;

	// @Scheduled(fixedRate = 5000)
	 
/*
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_0() {
		log.info("flushGpdm_0 start");
		flushGpdm(0, 200001);
		log.info("flushGpdm_0 stop");
	}
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_1() {
		log.info("flushGpdm_1 start");
		flushGpdm(200001, 400001);
		log.info("flushGpdm_1 stop");
	}
	
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_2() {
		log.info("flushGpdm_2 start");
		flushGpdm(400001, 600001);
		log.info("flushGpdm_2 stop");
	}
	
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_3() {
		log.info("flushGpdm_3 start");
		flushGpdm(600001, 800001);
		log.info("flushGpdm_3 stop");
	}
	
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_4() {
		log.info("flushGpdm_4 start");
		flushGpdm(800001, 1000001);
		log.info("flushGpdm_4 stop");
	}
	
*/	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_0() {
		log.info("flushGp_0 start");
		flushGpAndDp(0,3000,30);
		log.info("flushGp_0 stop"); 
	}
	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_1() {
		log.info("flushGp_1 start");
		flushGpAndDp(3000,6000,30);
		log.info("flushGp_1 stop"); 
	}
	
	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_2() {
		log.info("flushGp_2 start");
		flushGpAndDp(6000,9000,30);
		log.info("flushGp_2 stop"); 
	}
	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_3() {
		log.info("flushGp_3 start");
		flushGpAndDp(9000,12000,30);
		log.info("flushGp_3 stop"); 
	}
	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_4() {
		log.info("flushGp_4 start");
		flushGpAndDp(12000,14000,30);
		log.info("flushGp_4 stop"); 
	}
	
	
	public void flushGpAndDp(int nBegin,int nLen,int nTime){
		SinaDataOpt sinaDataOpt = new SinaDataOpt();
		StringBuffer sBuffer = new StringBuffer();
		Map<String,String> mapTemp = new HashMap<String,String>();
		Map<String, String[]> mapData = null;
		Limit limit = new Limit();
		try {
			for(int i=0;i<nTime;i++){
				limit.setnBegin(nBegin);
				limit.setnLen(nLen/nTime);
				String sGpdm = readGpdm(limit,sBuffer);
				if(sGpdm.trim().equals("")) break;
				mapData = sinaDataOpt.getSinaData(sGpdm,"str_");
				saveGp(mapData,mapTemp);
				mapTemp.clear();
				mapData = null;
				mapData = sinaDataOpt.getSinaData(sGpdm.replace("s", "s_s"),"_s_");
				saveDp(mapData,mapTemp);
				mapTemp.clear();
				mapData = null;
				nBegin = nBegin + nLen/nTime;
				sBuffer.setLength(0);
			}
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		mapTemp.clear();
		sinaDataOpt.destroyData();
		mapTemp = null;
		sBuffer = null;
		sinaDataOpt = null;
		limit = null;
	}
	
	public String readGpdm(Limit limit,StringBuffer sBuffer){
		try {
			sBuffer.setLength(0);
			List<Gpdm> listGpdm = gpdmService.selectLimit(limit);
			for(Gpdm gpdm:listGpdm){
				sBuffer.append(gpdm.getGpdm()+',');
			}
			sBuffer.deleteCharAt(sBuffer.length()-1);
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		return sBuffer.toString();
	}

	public void flushGpdm(int nbegin, int nLen) {
		StringBuffer sBuffer = new StringBuffer();
		SinaDataOpt sinaDataOpt = new SinaDataOpt();
		Gpdm clsGpdm = new Gpdm();
		Map<String, String[]> mapData = null;
		for (int i = nbegin; i < nLen; i++) {
			String sGpdm = "00000" + i;
			sGpdm = sGpdm.substring(sGpdm.length() - 6, sGpdm.length());
			sBuffer.append("s_sh" + sGpdm + ",");
			if (i % 50 == 0) {
				try{
					sBuffer.append("s_sh" + sGpdm);
					mapData = sinaDataOpt.getSinaData(sBuffer.toString(),"_s_");
					saveGpdm(mapData,clsGpdm);
					mapData = null;
					mapData = sinaDataOpt.getSinaData(sBuffer.toString().replace('h', 'z'),"_s_");
					saveGpdm(mapData,clsGpdm);
					mapData = null;
					sBuffer.setLength(0);
				}catch(Exception e)
				{
					log.warn(e.getMessage());
				}
				
			}
		}
		sinaDataOpt.destroyData();
		sBuffer = null;
		sinaDataOpt = null;
		clsGpdm = null;
	}

	private void saveGpdm(Map<String, String[]> mapData,Gpdm clsGpdm) throws Exception{
		for (Map.Entry<String, String[]> entry : mapData.entrySet()) {
			clsGpdm.setGpdm(entry.getKey());
			clsGpdm.setGpmc(entry.getValue()[0]);
			gpdmService.save(clsGpdm);
		}
	}
	
	private void saveGp(Map<String, String[]> mapData,Map<String,String> mapTemp) throws Exception{
		for (Map.Entry<String, String[]> entry : mapData.entrySet()) {
			gpService.save(DataOpt.buildMap(DataOpt.GP_FIELDNAME, entry.getValue(), mapTemp));
		}
	}
	
	private void saveDp(Map<String, String[]> mapData,Map<String,String> mapTemp) throws Exception{
		for (Map.Entry<String, String[]> entry : mapData.entrySet()) {
			dpService.save(DataOpt.buildMap(DataOpt.DP_FIELDNAME, entry.getValue(), mapTemp));
		}
	}

}
