package com.mn;

import com.mn.config.Const;
import com.mn.persistent.MysqlOpt;

import junit.framework.TestCase;

public class MysqlOptTest extends TestCase implements Const{
	
	MysqlOpt opt = new MysqlOpt();
	public void testMysql(){
	    opt.start();
	    opt.select("SELECT * FROM sdsj.act_ru_task");
	    opt.update("delete from lc_jcjl");
	    opt.end();
	}
}
