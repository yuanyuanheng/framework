package com.mn.proc;

import java.util.List;

import com.mn.config.Const;

/**
 * 数据保存基类
 * @author yuanyuanheng@126.com
 *
 */
public abstract class PersistentOpt implements Const {
	public abstract boolean start();
	public abstract void end();
	public abstract List<Object> select(String sSql);
	public abstract void update(String sSql);
}
