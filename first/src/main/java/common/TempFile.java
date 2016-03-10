package common;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class TempFile {
	private Path m_path;
	
	public TempFile(String sFilePath,String sFileName){
		m_path = Paths.get(sFilePath,sFileName);
	}
	public void write(InputStream is) throws Exception{
		Files.deleteIfExists(m_path);
		Files.copy(is,m_path);
	}
	public void delete() throws Exception{
		Files.deleteIfExists(m_path);
	}
	public Path getM_path() {
		return m_path;
	}
	
}
