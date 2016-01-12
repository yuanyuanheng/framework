
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for gp_gpdm
-- ----------------------------
DROP TABLE IF EXISTS gp_gpdm;
CREATE TABLE gp_gpdm (
	gpdm	varchar(32)	NOT NULL COMMENT '股票代码',
	gpmc	varchar(50) 	DEFAULT NULL COMMENT '股票名字',
  	PRIMARY KEY (gpdm)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gp_sina
-- ----------------------------
DROP TABLE IF EXISTS gp_sina;
CREATE TABLE gp_sina (
	gpdm	varchar(32)	DEFAULT NULL COMMENT '股票代码',
	gp	varchar(255) 	NOT NULL COMMENT '股票',
	dp	varchar(255) 	DEFAULT NULL COMMENT '大盘',
	rqsj varchar(50) DEFAULT NULL COMMENT '日期时间',
	PRIMARY KEY (gp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for gp_dp
-- ----------------------------
DROP TABLE IF EXISTS gp_dp;
CREATE TABLE gp_dp (
	zsmc	varchar(50)	DEFAULT NULL COMMENT '指数名称',
	dqzs	float	DEFAULT NULL COMMENT '当前指数',
	jrbhz	float	DEFAULT NULL COMMENT '今日变化值',
	jrbhbfb	float	DEFAULT NULL COMMENT '今日变化百分比',
	cjl	float	DEFAULT NULL COMMENT '成交量（手）',
	cje	float	DEFAULT NULL COMMENT '成交额（万元）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gp_gp
-- ----------------------------
DROP TABLE IF EXISTS gp_gp;
CREATE TABLE gp_gp (
	gpmc	varchar(50) 	DEFAULT NULL COMMENT '股票名字',
	jrkpj	float	DEFAULT NULL COMMENT '今日开盘价',
	zrspj	float	DEFAULT NULL COMMENT '昨日收盘价',
	dqjg	float	DEFAULT NULL COMMENT '当前价格',
	jrzgj	float	DEFAULT NULL COMMENT '今日最高价',
	jrzdj	float	DEFAULT NULL COMMENT '今日最低价',
	jmj		float	DEFAULT NULL COMMENT '竞买价',
	jmmj	float	DEFAULT NULL COMMENT '竞卖价',
	cjgps	float	DEFAULT NULL COMMENT '成交的股票数',
	cjje	float	DEFAULT NULL COMMENT '成交金额',
	m1sq	float	DEFAULT NULL COMMENT '买1申请',
	m1bj	float	DEFAULT NULL COMMENT '买1报价',
	m2sq	float	DEFAULT NULL COMMENT '买2申请',
	m2bj	float	DEFAULT NULL COMMENT '买2报价',
	m3sq	float	DEFAULT NULL COMMENT '买3申请',
	m3bj	float	DEFAULT NULL COMMENT '买3报价',
	m4sq	float	DEFAULT NULL COMMENT '买4申请',
	m4bj	float	DEFAULT NULL COMMENT '买4报价',
	m5sq	float	DEFAULT NULL COMMENT '买5申请',
	m5bj	float	DEFAULT NULL COMMENT '买5报价',
	mm1sq	float	DEFAULT NULL COMMENT '卖1申请',
	mm1bj	float	DEFAULT NULL COMMENT '卖1报价',
	mm2sq	float	DEFAULT NULL COMMENT '卖2申请',
	mm2bj	float	DEFAULT NULL COMMENT '卖2报价',
	mm3sq	float	DEFAULT NULL COMMENT '卖3申请',
	mm3bj	float	DEFAULT NULL COMMENT '卖3报价',
	mm4sq	float	DEFAULT NULL COMMENT '卖4申请',
	mm4bj	float	DEFAULT NULL COMMENT '卖4报价',
	mm5sq	float	DEFAULT NULL COMMENT '卖5申请',
	mm5bj	float	DEFAULT NULL COMMENT '卖5报价',
	rq	varchar(10) 	DEFAULT NULL COMMENT '	日期',
	sj	varchar(8) 	DEFAULT NULL COMMENT '	时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;