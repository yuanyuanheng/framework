package mysql;

public class Mysql {
	private String sUserName;
	private String sPassword;
	private String sDriverClassName;
	private String sUrl;

	public Mysql(String sUserName,String sPassword,String sDriverClassName,String sUrl){
		this.sUserName = sUserName;
		this.sPassword = sPassword;
		this.sDriverClassName = sDriverClassName;
		this.sUrl = sUrl;
	}
	
	public Mysql(){
		
	}
	
	public String getsUserName() {
		return sUserName;
	}

	public void setsUserName(String sUserName) {
		this.sUserName = sUserName;
	}

	public String getsPassword() {
		return sPassword;
	}

	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}

	public String getsDriverClassName() {
		return sDriverClassName;
	}

	public void setsDriverClassName(String sDriverClassName) {
		this.sDriverClassName = sDriverClassName;
	}

	public String getsUrl() {
		return sUrl;
	}

	public void setsUrl(String sUrl) {
		this.sUrl = sUrl;
	}

}
