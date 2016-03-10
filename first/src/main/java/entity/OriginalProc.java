package entity;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.protocol.HTTP;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import common.Base;
import common.Convert;
import common.TempFile;
import mysql.OriginalDao;
import status.CaptureStatus;

public class OriginalProc {
	private Original m_objOriginal;
	private HttpEntity m_httpEntity;
	private OriginalDao m_objOriginalDao;
	
	public OriginalProc(String sUrl, HttpEntity httpEntity,String sKeyOld, String sValue){
		this.m_httpEntity = httpEntity;
		m_objOriginalDao = new OriginalDao();
		m_objOriginal = new Original();
		m_objOriginal.setM_sType(typeProc());
		m_objOriginal.setM_sKey(Convert.toString(sUrl.getBytes()));
		m_objOriginal.setM_sKeyOld(Convert.toString(sKeyOld.getBytes()));
		m_objOriginal.setM_nStatus(CaptureStatus.YES.getM_nIndex());
		m_objOriginal.setM_sValue(sValue);
	}
	
	public void save(){
		TempFile objTempFile = new TempFile(Base.m_userDir,m_objOriginal.getM_sKey());
		try {
			objTempFile.write(m_httpEntity.getContent());
			m_objOriginalDao.insert(m_objOriginal);
			parse(objTempFile);
			objTempFile.delete();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		}
	}
	
	public void parse(TempFile objTempFile){
		try {
			Document doc = Jsoup.parse(objTempFile.getM_path().toFile(),m_objOriginal.getM_sType());
			Elements eLinks = doc.getElementsByTag("a");
			Original objOriginal = new Original();
			objOriginal.setM_sKeyOld(m_objOriginal.getM_sKey());
			for(Element eLink:eLinks){
				objOriginal.setM_sKey(Convert.toString(eLink.attr("href").getBytes()));
				objOriginal.setM_sValue(eLink.text());
				objOriginal.setM_nStatus(CaptureStatus.NO.getM_nIndex());
				objOriginal.setM_sType("-1");
				m_objOriginalDao.insert(objOriginal);
			}
			selectByStatus();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		}
	}
	
	public void selectByStatus(){
		Original objOriginal = new Original();
		objOriginal.setM_nStatus(CaptureStatus.NO.getM_nIndex());
		List<Original> list = m_objOriginalDao.selectList(objOriginal);
		for(Original o:list){
			Base.log(this.getClass()).info(o.getM_sValue());
		}
	}
	
	private String typeProc(){
		ContentType type = ContentType.getOrDefault(m_httpEntity);
		Charset charset = type.getCharset();
		if(charset == null){
			charset = HTTP.DEF_CONTENT_CHARSET;
		}
		return charset.name();
	}
}
