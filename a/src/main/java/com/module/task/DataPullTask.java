package com.module.task;

import javax.annotation.Resource;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.module.entity.gp.Gp;
import com.module.service.gp.GpService;
import com.module.util.DataOperate;

@Component
public class DataPullTask {
	public Logger log = LoggerFactory.getLogger(DataPullTask.class);
	@Resource(name="gpService")
	GpService gpService;
	Gp gp = new Gp();
	@Scheduled(fixedRate = 5000)
	public void getData(){
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet("http://hq.sinajs.cn/list=sh600389");
		CloseableHttpResponse httpResponse;
		try {
			httpResponse = httpClient.execute(httpGet);
			HttpEntity entity = httpResponse.getEntity();
			String sContext = EntityUtils.toString(entity);
			String[] strArray = DataOperate.getStrArray(sContext);
			gp.setGp(strArray);
			gpService.save(gp);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
