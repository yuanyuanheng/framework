package status;

public enum ValidStatus {
	NO("无效",1),YES("有效",2),UNKNOWN("未知",3);
	
	private String sName;
	private int nIndex;
	
	private ValidStatus(String sName,int nIndex){
		this.sName = sName;
		this.nIndex = nIndex;
	}

	public String getsName() {
		return sName;
	}

	public int getnIndex() {
		return nIndex;
	}
	
	public ValidStatus getEnum(int nIndex){
		for(ValidStatus c:ValidStatus.values()){
			if(c.nIndex == nIndex){
				return c;
			}
		}
		return null;
	}
	
	public ValidStatus getEnum(String sName){
		for(ValidStatus c:ValidStatus.values()){
			if(c.sName.equals(sName)){
				return c;
			}
		}
		return null;
	}
}
