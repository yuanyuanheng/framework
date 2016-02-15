package com.mn.persistent;

import java.io.IOException;
import java.net.URL;

import org.apache.commons.digester.Digester;
import org.xml.sax.SAXException;

import com.mn.config.Const;

public class ParseXml implements Const {
	
	public void dbFileParse(){
		  Digester digester = new Digester();
		  digester.setValidating( false );
		  digester.addObjectCreate( "dbFile", "com.mn.persistent.DbFile");
		  digester.addSetProperties( "dbFile" );
		  digester.addObjectCreate( "dbFile/file", "com.mn.bean.File");
		  digester.addSetProperties( "dbFile/file" );
		  digester.addSetNext( "dbFile/file", "setM_clsfile", "com.mn.bean.File" );
		  FileOpt dbFile;
		try {
			dbFile = (FileOpt) digester.parse(new URL(CURR_PATH+PERSISTENT_CONFIG_RESOURCE));
			LOG.info(dbFile.getM_clsfile().getM_sFilename());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  

	}
}
