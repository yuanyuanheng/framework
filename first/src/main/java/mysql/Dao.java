package mysql;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.Base;

public abstract class Dao <T> {
	public void insert(String statement, Object obj){
		SqlSession session = Base.sqlSessionFactory.openSession();
		try{
			session.insert(statement, obj);
			session.commit();
			return ;
		}finally{
			session.close();
		}
	}
	
	public void update(String statement, Object obj){
		SqlSession session = Base.sqlSessionFactory.openSession();
		try{
			session.update(statement, obj);
			session.commit();
			return ;
		}finally{
			session.close();
		}
	}
	
	public List<T> selectList(String statement, Object obj){
		SqlSession session = Base.sqlSessionFactory.openSession();
		try{
			List<T> list = session.selectList(statement, obj);
			return list;
		}finally{
			session.close();
		}
	}
}
