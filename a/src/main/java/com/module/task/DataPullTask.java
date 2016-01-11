package com.module.task;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.module.entity.gp.Gpdm;
import com.module.entity.gp.Limit;
import com.module.entity.gp.Sina;
import com.module.service.gp.DpService;
import com.module.service.gp.GpService;
import com.module.service.gp.GpdmService;
import com.module.service.gp.SinaService;
import com.module.util.DateTime;
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
	
	@Resource(name = "sinaService")
	SinaService sinaService;
	
	// @Scheduled(fixedRate = 5000)
	 

	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_0() {
		log.info("flushGpdm_0 start");
		flushGpdm(0, 200000,50);
		log.info("flushGpdm_0 stop");
	}
	
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_1() {
		log.info("flushGpdm_1 start");
		flushGpdm(200000, 200000,50);
		log.info("flushGpdm_1 stop");
	}
	
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_2() {
		log.info("flushGpdm_2 start");
		flushGpdm(400000, 200000,50);
		log.info("flushGpdm_2 stop");
	}
	
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_3() {
		log.info("flushGpdm_3 start");
		flushGpdm(600000, 200000,50);
		log.info("flushGpdm_3 stop");
	}
	
	@Scheduled(fixedDelay = 60*60*1000)
	public void flushGpdm_4() {
		log.info("flushGpdm_4 start");
		flushGpdm(800000, 200000,50);
		log.info("flushGpdm_4 stop");
	}
	
	/*	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_0() {
		log.info("flushGp_0 start");
		flushSina(0,3000,30);
		log.info("flushGp_0 stop"); 
	}
	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_1() {
		log.info("flushGp_1 start");
		flushSina(3000,6000,30);
		log.info("flushGp_1 stop"); 
	}
	
	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_2() {
		log.info("flushGp_2 start");
		flushSina(6000,9000,30);
		log.info("flushGp_2 stop"); 
	}
	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_3() {
		log.info("flushGp_3 start");
		flushSina(9000,12000,30);
		log.info("flushGp_3 stop"); 
	}
	
	@Scheduled(fixedDelay = 600000)
	public void flushGp_4() {
		log.info("flushGp_4 start");
		flushSina(12000,14000,30);
		log.info("flushGp_4 stop"); 
	}
	*/
	public void flushSina(int nBegin,int nLen,int nTime){
		SinaDataOpt sinaGp = new SinaDataOpt();
		SinaDataOpt sinaDp = new SinaDataOpt();
		StringBuffer sBuffer = new StringBuffer();
		Sina clsSina = new Sina();
		Map<String, String> mapGp = null;
		Map<String, String> mapDp = null;
		Limit limit = new Limit();
		try {
			for(int i=0;i<nTime;i++){
				limit.setnBegin(nBegin);
				limit.setnLen(nLen/nTime);
				String sGpdm = readGpdm(limit,sBuffer);
				if(sGpdm.trim().equals("")) break;
				mapGp = sinaGp.getSinaData(sGpdm,"str_");
				mapDp = sinaDp.getSinaData(sGpdm.replace("s", "s_s"),"_s_");
				saveSina(mapGp,mapDp,clsSina);
				nBegin = nBegin + nLen/nTime;
				sBuffer.setLength(0);
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		sinaGp.destroyData();
		sinaDp.destroyData();
		clsSina = null;
		sBuffer = null;
		sinaGp = null;
		sinaDp = null;
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
			log.error(e.getMessage());
		}
		return sBuffer.toString();
	}

	public void flushGpdm(int nBegin, int nLen,int nTime) {
		StringBuffer sBuffer = new StringBuffer();
		SinaDataOpt sinaDataOpt = new SinaDataOpt();
		Gpdm clsGpdm = new Gpdm();
		Map<String, String> mapData = null;
		
		for (int i = 0,j=0; i < nLen; i++,j++) {
			String sGpdm = "00000" + (nBegin+i);
			sGpdm = sGpdm.substring(sGpdm.length() - 6, sGpdm.length());
			sBuffer.append("s_sh" + sGpdm + ",");
			if(j<nTime) continue;
			try{
				j=0;
				sBuffer.deleteCharAt(sBuffer.length()-1);
				log.info(sBuffer.toString());
				mapData = sinaDataOpt.getSinaData(sBuffer.toString(),"_s_");
				saveGpdm(mapData,clsGpdm);
				mapData = null;
				mapData = sinaDataOpt.getSinaData(sBuffer.toString().replace('h', 'z'),"_s_");
				saveGpdm(mapData,clsGpdm);
				mapData = null;
				sBuffer.setLength(0);
			}catch(Exception e)
			{
				log.error(e.getMessage());
			}
		}
		sinaDataOpt.destroyData();
		sBuffer = null;
		sinaDataOpt = null;
		clsGpdm = null;
	}

	private void saveSina(Map<String, String> gpData,Map<String, String> dpData,Sina clsSina) throws Exception{
		if(gpData.size() != dpData.size()) return ;
		for (Map.Entry<String, String> entry : gpData.entrySet()) {
			clsSina.setGpdm(entry.getKey());
			clsSina.setGp(entry.getValue());
			clsSina.setDp(dpData.get(entry.getKey()));
			clsSina.setRqsj(DateTime.ToString());
			sinaService.save(clsSina);
		}
	}
	
	private void saveGpdm(Map<String, String> mapData,Gpdm clsGpdm) throws Exception{
		for (Map.Entry<String, String> entry : mapData.entrySet()) {
			clsGpdm.setGpdm(entry.getKey());
			String sGpmc = entry.getValue();
			sGpmc = sGpmc.substring(0,sGpmc.indexOf(','));
			clsGpdm.setGpmc(sGpmc);
			log.info(clsGpdm.toString());
			gpdmService.save(clsGpdm);
		}
	}
	

}
