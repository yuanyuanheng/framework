package com.mn.persistent;

import java.util.List;

import com.mn.proc.PersistentOpt;

public class DbFile implements PersistentOpt{

	private com.mn.bean.File m_clsfile;
	

	public com.mn.bean.File getM_clsfile() {
		return m_clsfile;
	}

	public void setM_clsfile(com.mn.bean.File m_clsfile) {
		this.m_clsfile = m_clsfile;
	}

	public List<Object> select() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean updata() {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean insert() {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}

}
