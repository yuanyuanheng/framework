package status;

public enum CaptureStatus {
	NO("未完成",1),YES("已完成",2),DO("正在做",3);
	
	private String m_sName;
	private int m_nIndex;
	
	private CaptureStatus(String sName,int nIndex){
		this.m_sName = sName;
		this.m_nIndex = nIndex;
	}

	public String getM_sName() {
		return m_sName;
	}

	public int getM_nIndex() {
		return m_nIndex;
	}
	
	public CaptureStatus getEnum(int nIndex){
		for(CaptureStatus c:CaptureStatus.values()){
			if(c.m_nIndex == nIndex){
				return c;
			}
		}
		return null;
	}
	
	public CaptureStatus getEnum(String sName){
		for(CaptureStatus c:CaptureStatus.values()){
			if(c.m_sName.equals(sName)){
				return c;
			}
		}
		return null;
	}
}
