package com.mn.proc;

import java.util.List;

/**
 * 数据保存基类
 * @author yuanyuanheng@126.com
 *
 */
public interface PersistentOpt {
	public List<Object> select();
	public boolean updata();
	public boolean insert();
	public boolean delete();
}
