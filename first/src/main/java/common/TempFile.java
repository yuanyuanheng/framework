package common;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class TempFile {
	private Path path;
	
	public TempFile(String sFilePath,String sFileName){
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
