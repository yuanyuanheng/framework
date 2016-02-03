package com.mn.persistent;

import java.util.List;

import com.mn.bean.Mysql;
import com.mn.proc.PersistentOpt;

public class DbMysql implements PersistentOpt{
	private Mysql mysql;
	
	public Mysql getMysql() {
		return mysql;
	}

	public void setMysql(Mysql mysql) {
		this.mysql = mysql;
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
