package common;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class TempFile {
	private Path path;
	
	public TempFile(String sFilePath,String sFileName){
		try {
			if(!Files.isDirectory(Paths.get(sFilePath)))
				Files.createDirectory(Paths.get(sFilePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Base.log(this.getClass()).error(e.getMessage());
		}
		path = Paths.get(sFilePath,sFileName);
	}
	public void write(InputStream is) throws Exception{
		Files.deleteIfExists(path);
		Files.copy(is,path);
	}
	public void delete() throws Exception{
		Files.deleteIfExists(path);
	}
	public Path getpath() {
		return path;
	}
	
}
