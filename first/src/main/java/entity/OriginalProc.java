package entity;

import java.io.UnsupportedEncodingException;
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
import common.ConvertHex;
import common.TempFile;
import mysql.OriginalDao;
import status.CaptureStatus;

public class OriginalProc {
	
	OriginalDao objOriginalDao;

	public void save(List<Original> OriginalList, HttpEntity httpEntity) {
		for (Original obj : OriginalList) {
			TempFile objTempFile = new TempFile(Base.userDir, obj.getsUrl());
			try {
				objTempFile.write(httpEntity.getContent());
				obj.setsCode(codeProc(httpEntity));
				obj.setnStatus(CaptureStatus.DO.getnIndex());
				objOriginalDao.update(obj);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Base.log(this.getClass()).error(e.getMessage());
			}
		}
	}

	public void parse(List<Original> OriginalList) {
		for (Original obj : OriginalList) {
			TempFile objTempFile = new TempFile(Base.userDir, obj.getsUrl());
			try {
				Document doc = Jsoup.parse(objTempFile.getpath().toFile(), obj.getsCode());
				Elements eLinks = doc.getElementsByTag("a");
				Original objOriginal = new Original();
				objOriginal.setsUrlOld(obj.getsUrl());
				for (Element eLink : eLinks) {
					objOriginal.setsId(Base.getUUID());
					objOriginal.setsUrl(ConvertHex.toString(eLink.attr("href").getBytes()));
					objOriginal.setsContent(ConvertHex.toString(eLink.text().getBytes()));
					objOriginal.setnStatus(CaptureStatus.NO.getnIndex());
					objOriginal.setsCode(obj.getsCode());
					objOriginal.setsUrlOld(obj.getsUrl());
					objOriginalDao.insert(objOriginal);
				}
				objTempFile.delete();
				obj.setnStatus(CaptureStatus.YES.getnIndex());
				objOriginalDao.update(obj);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Base.log(this.getClass()).error(e.getMessage());
			}
		}

	}

	public void selectStatusDo() {
		Original objOriginal = new Original();
		objOriginal.setnStatus(CaptureStatus.DO.getnIndex());
		List<Original> OriginalList = objOriginalDao.selectList(objOriginal);
		for (Original o : OriginalList) {
			try {
				o.setsUrl(new String(ConvertHex.toByte(o.getsUrl()), o.getsCode()));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Base.log(this.getClass()).error(e.getMessage());
			}
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
}
