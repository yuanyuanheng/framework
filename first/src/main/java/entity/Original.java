package entity;

public class Original {
	private String sId;
	private String sLink;
	private String sState;
	private String sCode;
	private int nStatus;
	private String sLastId;
	private int nLevel;
	private int nLinkCount;
	private int nValid;

	public int getnLevel() {
		return nLevel;
	}

	public void setnLevel(int nLevel) {
		this.nLevel = nLevel;
	}

	public int getnLinkCount() {
		return nLinkCount;
	}

	public void setnLinkCount(int nLinkCount) {
		this.nLinkCount = nLinkCount;
	}

	public int getnValid() {
		return nValid;
	}

	public void setnValid(int nValid) {
		this.nValid = nValid;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsLastId() {
		return sLastId;
	}

	public void setsLastId(String sLastId) {
		this.sLastId = sLastId;
	}

	public String getsLink() {
		return sLink;
	}

	public void setsLink(String sLink) {
		this.sLink = sLink;
	}

	public String getsState() {
		return sState;
	}

	public void setsState(String sState) {
		this.sState = sState;
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
