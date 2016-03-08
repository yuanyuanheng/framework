package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import common.Base;

public class MysqlOpt {
	private Mysql m_mysql;
	private Connection m_conn;

	public void setM_mysql(Mysql m_mysql) {
		this.m_mysql = m_mysql;
	}

	private void initConn() throws Exception {
		Class.forName(m_mysql.getM_sDriverClassName());
		m_conn = DriverManager.getConnection(m_mysql.getM_sUrl(), m_mysql.getM_sUserName(), m_mysql.getM_sPassword());
	}

	public boolean start() throws Exception {
		if (null == m_mysql) {
			m_mysql = Base.m_mysql;
		}
		if (null == m_conn) {
			initConn();
		}
		return true;
	}

	public void end() throws Exception {
		if (null != m_conn) {
			m_conn.close();
		}
	}

	public List<Object> select(String sSql) throws Exception {
		if (null != m_conn) {
			Statement stmt = m_conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSql);
			rs.close();
			stmt.close();
			rs = null;
			stmt = null;
		}
		return null;
	}

	public void update(String sSql) throws Exception {
		if (null != m_conn) {
			Statement stmt = m_conn.createStatement();
			stmt.executeUpdate(sSql);
			stmt.close();
			stmt = null;
		}
	}

}
