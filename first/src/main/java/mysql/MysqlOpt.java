package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import common.Base;

public class MysqlOpt {
	private Mysql mysql;
	private Connection conn;

	public void setmysql(Mysql mysql) {
		this.mysql = mysql;
	}

	private void initConn() throws Exception {
		Class.forName(mysql.getsDriverClassName());
		conn = DriverManager.getConnection(mysql.getsUrl(), mysql.getsUserName(), mysql.getsPassword());
	}

	public boolean start() throws Exception {
		if (null == mysql) {
			mysql = Base.mysql;
		}
		if (null == conn) {
			initConn();
		}
		return true;
	}

	public void end() throws Exception {
		if (null != conn) {
			conn.close();
		}
	}

	public List<Object> select(String sSql) throws Exception {
		if (null != conn) {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSql);
			rs.close();
			stmt.close();
			rs = null;
			stmt = null;
		}
		return null;
	}

	public void update(String sSql) throws Exception {
		if (null != conn) {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sSql);
			stmt.close();
			stmt = null;
		}
	}

}
