package mysql;

import java.util.List;

import entity.Original;

public class OriginalDao extends Dao<Original>{
	public void insert(Original objOriginal){
		super.insert("Original.insert", objOriginal);
	}
	public List<Original> selectList(Original objOriginal){
		return super.selectList("Original.selectList",objOriginal);
	}
	public void update(Original objOriginal){
		super.update("Original.update", objOriginal);
	}
}
