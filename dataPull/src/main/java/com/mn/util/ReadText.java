package com.mn.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.mn.config.Const;

public class ReadText implements Const{
	
	//注意此处的newBufferedRead的charset参数，如果和所要读取的文件的编码不一致，则会抛出异常  
    //java的新特性，不用自己关闭流 
	public static String Read(String sUri){
		StringBuilder sBuilder = new StringBuilder();
		Path path = Paths.get(sUri);
		String line = "";  
		 try {  
	            if(Files.isReadable(path)){  
	                BufferedReader br = Files.newBufferedReader(path, Charset.defaultCharset()); 
	                while((line = br.readLine()) != null){  
	                    sBuilder.append(line+"\n"); 
	                }  
	                line = sBuilder.toString();
	                sBuilder.setLength(0);
	                sBuilder = null;
	            }else{  
	                LOG.warning("不能读取文件");
	            }  
	        } catch (IOException e) {  
	            LOG.severe("文件读异常："+e.getMessage());
	            e.printStackTrace();
	        }  
		return line;
	}
}
