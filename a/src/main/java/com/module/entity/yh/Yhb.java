package com.module.entity.yh;

public class Yhb {
	private String id;
	private String yhid;
	private String yhm;
	private String mm;
	private String zhlx;
	private String scdlsj;
	private String ipdz;
	private String xmxxqrzt;

	public Yhb() {
	}

	public Yhb(String sId,String sYhid,String sYhm,String sMm,String sZhlx,
			String sScdlsj,String sIpdz,String sXmxxqrzt) {
		id = sId;
		yhid = sYhid;
		yhm = sYhm;
		mm = sMm;
		zhlx = sZhlx;
		scdlsj = sScdlsj;
		ipdz = sIpdz;
		xmxxqrzt = sXmxxqrzt;
		
	}

	@Override
	public String toString() {
		return "Yhb [" + "yhid=" + id + "yhid=" + yhid + ", yhm=" + yhm + ", mm=" + mm + ", zhlx=" + zhlx + ", scdlsj="
				+ scdlsj + ", ipdz=" + ipdz + ", xmxxqrzt=" + xmxxqrzt + "]";
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setYhid(String yhid) {
		this.yhid = yhid;
	}

	public void setYhm(String yhm) {
		this.yhm = yhm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public void setZhlx(String zhlx) {
		this.zhlx = zhlx;
	}

	public void setScdlsj(String scdlsj) {
		this.scdlsj = scdlsj;
	}

	public void setIpdz(String ipdz) {
		this.ipdz = ipdz;
	}

	public void setXmxxqrzt(String xmxxqrzt) {
		this.xmxxqrzt = xmxxqrzt;
	}

	public String getId() {
		return id;
	}

	public String getYhid() {
		return yhid;
	}

	public String getYhm() {
		return yhm;
	}

	public String getMm() {
		return mm;
	}

	public String getZhlx() {
		return zhlx;
	}

	public String getScdlsj() {
		return scdlsj;
	}

	public String getIpdz() {
		return ipdz;
	}

	public String getXmxxqrzt() {
		return xmxxqrzt;
	}

}
