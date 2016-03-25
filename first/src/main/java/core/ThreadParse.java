package core;

import java.util.List;

import entity.Original;
import entity.OriginalProc;
import mysql.OriginalDao;
import status.CaptureStatus;

public class ThreadParse extends Thread {

	@Override
	public void run() {
		 OriginalProc objOriginalProc = new OriginalProc();
		 OriginalDao objOriginalDao = new OriginalDao();
		 objOriginalProc.setObjOriginalDao(objOriginalDao);
		 Original objOriginal = new Original();
		 objOriginal.setnStatus(CaptureStatus.DO.getnIndex());
		 List<Original> listOriginal = objOriginalDao.selectList(objOriginal);
		 for(int i=0; i<listOriginal.size(); i++){
			 objOriginal = listOriginal.get(i);
			 objOriginalProc.parse(objOriginal);
		 }
		
	}

}
