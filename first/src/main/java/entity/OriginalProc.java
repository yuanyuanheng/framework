package entity;

import java.net.URI;
import java.nio.charset.Charset;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.HttpEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.protocol.HTTP;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import common.Base;
import common.ConvertHex;
import common.TempFile;
import mysql.OriginalDao;
import status.CaptureStatus;
import status.ValidStatus;

public class OriginalProc {
	
	private OriginalDao objOriginalDao;
	
	public void setObjOriginalDao(OriginalDao objOriginalDao) {
		this.objOriginalDao = objOriginalDao;
	}

	public void save(Original objOriginal, HttpEntity httpEntity) {
		TempFile objTempFile = new TempFile(Base.tempDir, objOriginal.getsLink());
		try {
			objTempFile.write(httpEntity.getContent());
			objOriginal.setsCode(codeProc(httpEntity));
			objOriginal.setnStatus(CaptureStatus.DO.getnIndex());
			objOriginal.setnValid(ValidStatus.YES.getnIndex());
			objOriginalDao.update(objOriginal);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		}
	}
	
	public void save(Original objOriginal) {
		objOriginal.setnStatus(CaptureStatus.YES.getnIndex());
		objOriginal.setnValid(ValidStatus.NO.getnIndex());
		objOriginalDao.update(objOriginal);
	}

	public void parse(Original objOriginal) {
		TempFile objTempFile = new TempFile(Base.tempDir, objOriginal.getsLink());
		try {
			Document doc = Jsoup.parse(objTempFile.getpath().toFile(), objOriginal.getsCode());
			Elements eLinks = doc.getElementsByTag("a");
			Original objOriginalTemp = new Original();
			objOriginalTemp.setsLastId(objOriginal.getsId());
			for (Element eLink : eLinks) {
				objOriginalTemp.setsId(Base.getUUID());
				objOriginalTemp.setsLink(ConvertHex.toString(eLink.attr("href").getBytes()));
				objOriginalTemp.setsState(getState(eLink.text()));
				objOriginalTemp.setnStatus(CaptureStatus.NO.getnIndex());
				objOriginalTemp.setsCode(objOriginal.getsCode());
				objOriginalTemp.setnLevel(objOriginal.getnLevel() + 1);
				objOriginalTemp.setnLinkCount(0);
				objOriginalTemp.setnValid(ValidStatus.UNKNOWN.getnIndex());
				objOriginal.setnLinkCount(objOriginal.getnLinkCount() + 1);
				objOriginalDao.insert(objOriginalTemp);
			}
			objTempFile.delete();
			objOriginal.setnStatus(CaptureStatus.YES.getnIndex());
			objOriginalDao.update(objOriginal);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		}

	}

	private String codeProc(HttpEntity httpEntity) {
		ContentType type = ContentType.getOrDefault(httpEntity);
		Charset charset = type.getCharset();
		if (charset == null) {
			charset = HTTP.DEF_CONTENT_CHARSET;
		}
		return charset.name();
	}
	
	public URI getLink(Original objOriginal){
		try {
			String sLink = new String(ConvertHex.toByte(objOriginal.getsLink()),objOriginal.getsCode());
			if(sLink.contains("http")){
				return URI.create(sLink);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		}
		return null;
	}
	
	public String getState(String sLinkText){
		String sReg="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";  
        Pattern p = Pattern.compile(sReg);     
        Matcher m = p.matcher(sLinkText); 
        sLinkText = m.replaceAll("").trim();
        if(sLinkText.length()>50){
        	sLinkText = sLinkText.substring(0, 50);
        }
        Base.log(this.getClass()).info(sLinkText);
        return sLinkText;
	}
}
