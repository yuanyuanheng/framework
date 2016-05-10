package com.util;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;

public class FileUtil {
	private Path path;

	public FileUtil(String sFilePath, String sFileName) {
		try {
			if (!Files.isDirectory(Paths.get(sFilePath)))
				Files.createDirectory(Paths.get(sFilePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		path = Paths.get(sFilePath, sFileName);
	}

	public void deleteAndWrite(String str){
		try {
			Files.copy(new ByteArrayInputStream(str.getBytes()), path,StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteAndWrite(InputStream in){
		try {
			Files.copy(in, path,StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void WriteExist(String str){
		try {
			if(Files.exists(path)){
				BufferedWriter br = Files.newBufferedWriter(path, StandardOpenOption.APPEND);
				br.write(str);
				br.close();
			}else{
				Files.copy(new ByteArrayInputStream(str.getBytes()), path,StandardCopyOption.REPLACE_EXISTING);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void delete(){
		try {
			Files.deleteIfExists(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Path getpath() {
		return path;
	}
}
