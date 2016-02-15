package com.mn.persistent;

import java.util.List;

import com.mn.proc.PersistentOpt;

public class FileOpt extends PersistentOpt{

	private com.mn.bean.File m_clsfile;
	

	public com.mn.bean.File getM_clsfile() {
		return m_clsfile;
	}

	public void setM_clsfile(com.mn.bean.File m_clsfile) {
		this.m_clsfile = m_clsfile;
	}

	@Override
	public boolean start() {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public void end() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Object> select(String sSql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(String sSql) {
		// TODO Auto-generated method stub
	}

	

	
}
