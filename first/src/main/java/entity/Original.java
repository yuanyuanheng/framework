package entity;

public class Original {
	private String sId;
	private String sUrl;
	private String sContent;
	private String sCode;
	private int nStatus;
	private String sUrlOld;
	
	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsUrlOld() {
		return sUrlOld;
	}

	public void setsUrlOld(String sUrlOld) {
		this.sUrlOld = sUrlOld;
	}

	public String getsUrl() {
		return sUrl;
	}

	public void setsUrl(String sUrl) {
		this.sUrl = sUrl;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public int getnStatus() {
		return nStatus;
	}

	public void setnStatus(int nStatus) {
		this.nStatus = nStatus;
	}
	
}
