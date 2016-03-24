package status;

public enum CaptureStatus {
	NO("未完成",1),YES("已完成",2),DO("正在做",3);
	
	private String sName;
	private int nIndex;
	
	private CaptureStatus(String sName,int nIndex){
		this.sName = sName;
		this.nIndex = nIndex;
	}

	public String getsName() {
		return sName;
	}

	public int getnIndex() {
		return nIndex;
	}
	
	public CaptureStatus getEnum(int nIndex){
		for(CaptureStatus c:CaptureStatus.values()){
			if(c.nIndex == nIndex){
				return c;
			}
		}
		return null;
	}
	
	public CaptureStatus getEnum(String sName){
		for(CaptureStatus c:CaptureStatus.values()){
			if(c.sName.equals(sName)){
				return c;
			}
		}
		return null;
	}
}
