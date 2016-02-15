package com.mn.persistent;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.mn.bean.Mysql;
import com.mn.proc.PersistentOpt;

public class MysqlOpt extends PersistentOpt {
	private Mysql m_mysql;
	private Connection m_conn;

	public void setM_mysql(Mysql m_mysql) {
		this.m_mysql = m_mysql;
	}

	private void initConn() {
		try {
			Class.forName(m_mysql.getM_sDriverClassName());
			m_conn = DriverManager.getConnection(m_mysql.getM_sUrl(), m_mysql.getM_sUserName(), m_mysql.getM_sPassword());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			LOG.severe("数据库初始化异常:" + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			LOG.severe("获取数据库连接异常:" + e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public boolean start() {
		// TODO Auto-generated method stub
		if (null == m_mysql) {
			LOG.warning("使用初始化数据库");
			m_mysql = MYSQL;
		}
		
		if(null == m_conn){
			initConn();
		}
		
		return true;
	}

	@Override
	public void end() {
		// TODO Auto-generated method stub
		if(null != m_conn){
			try {
				m_conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				LOG.severe("释放数据库连接异常:" + e.getMessage());
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Object> select(String sSql) {
		// TODO Auto-generated method stub
		if(null == m_conn) {
			LOG.warning("数据库无连接");
		}else{
			LOG.warning("sql:"+sSql);
			try {
				Statement stmt = m_conn.createStatement();
				ResultSet rs = stmt.executeQuery(sSql);
				rs.close();
				stmt.close();
				rs = null;
				stmt = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				LOG.severe("数据库执行异常:" + e.getMessage());
				e.printStackTrace();
			}
		}
			
		return null;
	}

	@Override
	public void update(String sSql) {
		// TODO Auto-generated method stub
		if(null == m_conn) {
			LOG.warning("数据库无连接");
		}else{
			LOG.warning("sql:"+sSql);
			try {
				Statement stmt = m_conn.createStatement();
				stmt.executeUpdate(sSql);
				stmt.close();
				stmt = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				LOG.severe("数据库执行异常:" + e.getMessage());
				e.printStackTrace();
			}
		}
	}


}
