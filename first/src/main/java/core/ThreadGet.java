package core;

import java.net.URI;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.client.CloseableHttpClient;

import common.Base;
import entity.Original;
import entity.OriginalProc;
import mysql.OriginalDao;
import status.CaptureStatus;

public class ThreadGet extends Thread {

	@Override
	public void run() {
		 OriginalProc objOriginalProc = new OriginalProc();
		 OriginalDao objOriginalDao = new OriginalDao();
		 Original objOriginal = new Original();
		 HttpGet hg = new HttpGet();
		 objOriginalProc.setObjOriginalDao(objOriginalDao);
		 objOriginal.setnStatus(CaptureStatus.NO.getnIndex());
		 List<Original> listOriginal = objOriginalDao.selectList(objOriginal);
		 for(int i=0; i<listOriginal.size(); i++){
			 objOriginal = listOriginal.get(i);
			 try {
					CloseableHttpClient hc = HCPool.getHC();
					URI sLink = objOriginalProc.getLink(objOriginal);
					if(null == sLink){
						objOriginalProc.save(objOriginal);
						continue;
					}
					hg.setURI(sLink);
					CloseableHttpResponse response = hc.execute(hg, HttpClientContext.create());
					if(200 != response.getStatusLine().getStatusCode()){
						objOriginalProc.save(objOriginal);
						continue;
					}
					HttpEntity httpEntity = response.getEntity();
					objOriginalProc.save(objOriginal, httpEntity);
					response.close();
				} catch (Exception e) {
					e.printStackTrace();
					Base.log(this.getClass()).error(e.getMessage());
				}
		 }
		
	}

}
