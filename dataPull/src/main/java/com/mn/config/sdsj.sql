/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : sdsj

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2015-12-25 16:35:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- 1:Table structure for yh_yh T20160106
-- ----------------------------
DROP TABLE IF EXISTS yh_yh;
CREATE TABLE yh_yh (
  yhid	VARCHAR(32) NOT NULL COMMENT	'用户ID',
  yhm	VARCHAR(50) NOT NULL COMMENT	'用户名',
  mm	VARCHAR(32) NOT NULL COMMENT	'密码',
  zhlx	INT(2) NOT NULL COMMENT	'帐号类型',
  jhzt	INT(1) DEFAULT 0 NOT NULL COMMENT	'激活状态',
  scdlsj DATETIME DEFAULT NULL COMMENT	'最近登录时间',
  ipdz	VARCHAR(20) DEFAULT NULL COMMENT	'IP地址',
  xmxxqrzt	INT(1) DEFAULT 0  COMMENT	'项目学习确认状态',
  sczt	INT(1) DEFAULT 0 NOT NULL COMMENT '是否删除状态',
  PRIMARY KEY (yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '用户表';

-- ----------------------------
-- 2:Table structure for yh_yhxx T20160106
-- ----------------------------
DROP TABLE IF EXISTS yh_yhxx;
CREATE TABLE yh_yhxx (
  yhid	VARCHAR(32) NOT NULL COMMENT	'用户ID',
  ssgsid	VARCHAR(32) DEFAULT NULL COMMENT	'所属公司ID',
  ssgsmc	VARCHAR(100) DEFAULT NULL COMMENT	'所属公司名称',
  dz	VARCHAR(100) DEFAULT NULL COMMENT	'地址',
  dwmc	VARCHAR(100) NOT NULL COMMENT	'单位名称',
  yx	VARCHAR(50) DEFAULT NULL COMMENT	'邮箱',
  lxdh	VARCHAR(20) DEFAULT NULL COMMENT	'联系电话',
  lxrmc	VARCHAR(30) DEFAULT NULL COMMENT	'联系人名称',
  zzjgdm	VARCHAR(50) DEFAULT NULL COMMENT	'组织机构代码',
  yyzz	VARCHAR(100) DEFAULT NULL COMMENT	'营业执照',
  syt	VARCHAR(100) DEFAULT NULL COMMENT	'水印图',
  sfzfyj	VARCHAR(100) DEFAULT NULL COMMENT	'身份证复印件',
  sfzh	VARCHAR(18) DEFAULT NULL COMMENT	'身份证号',
  PRIMARY KEY (yhid),
  FOREIGN KEY(ssgsid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '用户信息表';

-- ----------------------------
-- 3:Table structure for yh_js T20160106
-- ----------------------------
DROP TABLE IF EXISTS yh_js;
CREATE TABLE yh_js (
  jsid	VARCHAR(32) NOT NULL COMMENT	'角色ID',
  jsmc	VARCHAR(50) DEFAULT NULL COMMENT	'角色名称',
  ssjsz	INT(2) DEFAULT NULL COMMENT	'所属角色组',
  PRIMARY KEY (jsid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '角色表';
-- ----------------------------
-- 4:Table structure for yh_yhjs T20160106
-- ----------------------------
DROP TABLE IF EXISTS yh_yhjs;
CREATE TABLE yh_yhjs (
  yhid	VARCHAR(32) NOT NULL COMMENT	'用户ID',
  jsid	VARCHAR(32) NOT NULL COMMENT	'角色ID',
  FOREIGN KEY(yhid) REFERENCES yh_yh(yhid),
  FOREIGN KEY(jsid) REFERENCES yh_js(jsid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '用户角色表';

-- ----------------------------
-- 5:Table structure for yh_qx T20160106
-- ----------------------------
DROP TABLE IF EXISTS yh_qx;
CREATE TABLE yh_qx (
  qxid	VARCHAR(32) NOT NULL COMMENT	'权限ID',
  qxmc	VARCHAR(32) DEFAULT NULL COMMENT	'权限名称',	
  zyid 	VARCHAR(32) DEFAULT NULL COMMENT	'资源ID',
  yhz	INT(2) DEFAULT NULL COMMENT	'所属用户组',
  PRIMARY KEY (qxid),
  FOREIGN KEY(zyid) REFERENCES yh_zy(zyid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '权限表';
-- ----------------------------
-- 6:Table structure for yh_jsqx T20160106
-- ----------------------------
DROP TABLE IF EXISTS yh_jsqx;
CREATE TABLE yh_jsqx (
  jsid	VARCHAR(32) DEFAULT NULL COMMENT	'角色ID',
  qxid	VARCHAR(32) DEFAULT NULL COMMENT	'权限ID',
  FOREIGN KEY(jsid) REFERENCES yh_js(jsid),
  FOREIGN KEY(qxid) REFERENCES yh_qx(qxid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '角色权限表'; 
-- ----------------------------
-- 7:Table structure for yh_zy T20160106
-- ----------------------------
DROP TABLE IF EXISTS yh_zy;
CREATE TABLE yh_zy (
  zyid	VARCHAR(32) NOT NULL COMMENT	'资源ID',
  zymc	VARCHAR(100) DEFAULT NULL COMMENT	'资源名称',
  zy2	VARCHAR(100) DEFAULT NULL COMMENT	'资源路径',
  yhz	INT(2) DEFAULT NULL COMMENT	'所属用户组',
  PRIMARY KEY (zyid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '资源表';

-- ----------------------------
-- 8:Table structure for yh_jsqxzy T20160106
-- ----------------------------
DROP TABLE IF EXISTS yh_jsqxzy;
CREATE TABLE yh_jsqxzy (
  jsid	VARCHAR(32) DEFAULT NULL COMMENT	'角色ID',
  qxid	VARCHAR(32) DEFAULT NULL COMMENT	'权限ID',
  zyid	VARCHAR(32) DEFAULT NULL COMMENT	'资源ID',
  FOREIGN KEY(jsid) REFERENCES yh_js(jsid),
  FOREIGN KEY(qxid) REFERENCES yh_qx(qxid),
  FOREIGN KEY(zyid) REFERENCES yh_zy(zyid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '角色权限资源表';


-- ----------------------------
-- III2:Table structure for xt_xmfl T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_xmfl;
CREATE TABLE xt_xmfl (
	flid	VARCHAR(32) NOT NULL COMMENT	'分类id',
	mc	VARCHAR(50) NOT NULL COMMENT	'名称',
	cjrid	VARCHAR(32) NOT NULL COMMENT	'创建人id',
	cjrmc	VARCHAR(50) NOT NULL COMMENT	'创建人名称',
	cjsj	DATETIME DEFAULT NULL COMMENT	'创建时间',
	zhxgsj	DATETIME DEFAULT NULL COMMENT	'最后修改时间',
    PRIMARY KEY (flid),
	FOREIGN KEY(cjrid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '项目分类表';

-- ----------------------------
-- 1:Table structure for lc_xm T20150106
-- ----------------------------
DROP TABLE IF EXISTS lc_xm;
CREATE TABLE lc_xm (
  xmh VARCHAR(20) NOT NULL COMMENT '项目号',
  gch VARCHAR(20) NOT NULL COMMENT '工程号',
  xmmc VARCHAR(100) NOT NULL COMMENT '项目名称',
  flid VARCHAR(32) NOT NULL COMMENT '项目类型',
  xmdz VARCHAR(100) NOT NULL COMMENT '项目地址',
  xmgm VARCHAR(100) NOT NULL COMMENT '项目规模',
  tzgs FLOAT NOT NULL COMMENT '投资概算',
  wfzrzt VARCHAR(100) NOT NULL COMMENT '五方责任主体',
  ydxkzh VARCHAR(100) DEFAULT NULL COMMENT '用地许可证号',
  ghxkzh VARCHAR(100) DEFAULT NULL COMMENT '规划许可证号',
  sgxkzh VARCHAR(100) DEFAULT NULL COMMENT '施工许可证号',
  ydpzszh VARCHAR(100) DEFAULT NULL COMMENT '用地批准书证号',
  gtzh VARCHAR(100) DEFAULT NULL COMMENT '国土证号',
  ghyszh VARCHAR(100) DEFAULT NULL COMMENT '规划验收证号',
  ds INT(5) DEFAULT NULL COMMENT '栋数',
  zzjgdm VARCHAR(100) NOT NULL COMMENT '组织机构代码',
  zdgczt INT(1) NOT NULL COMMENT '重点工程状态',
  dalzzt INT(2) DEFAULT NULL COMMENT '档案流转状态',
  lcid VARCHAR(32) DEFAULT NULL COMMENT '流程ID',
  lxsj DATETIME DEFAULT NULL COMMENT '立项时间',  
  jhzt INT(1) NOT NULL COMMENT '激活状态',
  yhid VARCHAR(32) DEFAULT NULL COMMENT '建设单位ID',
  jsdwmc VARCHAR(100) DEFAULT NULL COMMENT '建设单位名称',
  bz VARCHAR(255) DEFAULT NULL COMMENT '备注',
  ywlb INT(2) DEFAULT NULL COMMENT '业务类别',
  dalb INT(2) NOT NULL COMMENT '档案类别',
  tzlx INT(2) NOT NULL COMMENT '通知类型',
  jsgcydghxkzh VARCHAR(50) NOT NULL COMMENT '建设工程用地规划许可证号',
  jsgcghxkzh VARCHAR(50) NOT NULL COMMENT '建设工程规划许可证号',
  PRIMARY KEY (xmh),
  FOREIGN KEY(yhid) REFERENCES yh_yh(yhid),
  UNIQUE KEY index_lcid (lcid),
  UNIQUE KEY index_yhid (yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '项目表';


-- ----------------------------
-- 2:Table structure for lc_zpjl T20150106
-- ----------------------------
DROP TABLE IF EXISTS lc_zpjl;
CREATE TABLE lc_zpjl (
  zpid	VARCHAR(32) NOT NULL COMMENT	'指派ID',
  xmh	VARCHAR(20) NOT NULL COMMENT	'项目号',
  zprid	VARCHAR(32) NOT NULL COMMENT	'指派人id',
  zprxm	VARCHAR(20) NOT NULL COMMENT	'指派人姓名',
  bzprid VARCHAR(32) NOT NULL COMMENT	'被指派人id',
  bzpr	VARCHAR(20) NOT NULL COMMENT	'被指派人',
  zpsj	DATETIME NOT NULL COMMENT	'指派时间',
  bz	VARCHAR(255) DEFAULT NULL COMMENT	'备注',
  PRIMARY KEY (zpid),
  FOREIGN KEY(xmh) REFERENCES lc_xm(xmh)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '指派记录表';
-- ----------------------------
-- 3:Table structure for lc_lasq T20150106
-- ----------------------------
DROP TABLE IF EXISTS lc_lasq;
CREATE TABLE `lc_lasq` (
   `lasqid` varchar(32) NOT NULL COMMENT '立案申请id',
   `lah` varchar(20) DEFAULT NULL COMMENT '立案号',
   `xmh` varchar(20) NOT NULL COMMENT '项目号',
   `cjdayjmlwcqk` varchar(50) NOT NULL COMMENT '城建档案移交目录完成情况',
   `zzgcdawcqk` varchar(50) NOT NULL COMMENT '纸质工程档案完成情况',
   `dzmlwcqk` varchar(50) NOT NULL COMMENT '电子目录完成情况',
   `sxdawcqk` varchar(50) NOT NULL COMMENT '声像档案完成情况',
   `wthyjwcqk` varchar(50) NOT NULL COMMENT '委托函（原件）完成情况',
   `sfzfyjwcqk` varchar(50) NOT NULL COMMENT '身份证复印件完成情况',
   `cjdayjmlsl` int(11) NOT NULL COMMENT '城建档案移交目录数量',
   `zzgcdasl` int(11) NOT NULL COMMENT '纸质工程档案数量',
   `dzmlsl` int(11) NOT NULL COMMENT '电子目录数量',
   `sxdasl` int(11) NOT NULL COMMENT '声像档案数量',
   `wthyjsl` int(11) NOT NULL COMMENT '委托函（原件）数量',
   `sfzfyjsl` int(11) NOT NULL COMMENT '身份证复印件数量',
   `sqsj` datetime NOT NULL COMMENT '申请时间',
   `sqrid` varchar(32) NOT NULL COMMENT '申请人id',
   `sqrmc` varchar(20) NOT NULL COMMENT '申请人名称',
   `dalb` int(1) DEFAULT NULL COMMENT '档案类别',
   `ywlb` int(1) DEFAULT NULL COMMENT '业务类别',
   `tzlx` int(1) DEFAULT NULL COMMENT '通知方式',
   `sqzt` int(1) DEFAULT NULL COMMENT '申请状态',
   PRIMARY KEY (`lasqid`),
   CONSTRAINT `lc_lasq_ibfk_1` FOREIGN KEY (`xmh`) REFERENCES `lc_xm` (`xmh`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='立案申请表';

-- ----------------------------
-- 4:Table structure for lc_yyssq T20150106
-- ----------------------------
DROP TABLE IF EXISTS lc_yyssq;
CREATE TABLE lc_yyssq (
    sqbbh	 VARCHAR(32) NOT NULL COMMENT 	'申请表编号',
    xmh	 VARCHAR(20) DEFAULT NULL COMMENT 	'项目号',
	ysfs	 INT(2) DEFAULT NULL COMMENT 	'验收方式',
	bt	 VARCHAR(20) DEFAULT NULL COMMENT 	'标题',
	sqdw	 VARCHAR(50) DEFAULT NULL COMMENT 	'申请单位',
	jsxmmc	 VARCHAR(100) DEFAULT NULL COMMENT 	'建设项目名称',
	jswzh VARCHAR(100) DEFAULT NULL COMMENT 	'建设位置',
	jsgm	 VARCHAR(100) DEFAULT NULL COMMENT 	'建设规模',
	gcsgzlys	 VARCHAR(50) DEFAULT NULL COMMENT 	'工程施工质量验收',
	xfys	 VARCHAR(50) DEFAULT NULL COMMENT 	'消防验收',
	rfys	 VARCHAR(50) DEFAULT NULL COMMENT 	'人防验收',
	flys	 VARCHAR(50) DEFAULT NULL COMMENT 	'防雷验收',
	ghys	 VARCHAR(50) DEFAULT NULL COMMENT 	'规划验收',
	hbys	 VARCHAR(50) DEFAULT NULL COMMENT 	'环保验收',
	wsys	 VARCHAR(50) DEFAULT NULL COMMENT 	'卫生验收',
	zjs	     INTEGER DEFAULT NULL COMMENT 	'总卷数',
	wzjs	 INTEGER DEFAULT NULL COMMENT 	'文字卷数',
	tzjs	 INTEGER DEFAULT NULL COMMENT 	'图纸卷数',
	cpjs	 INTEGER DEFAULT NULL COMMENT 	'磁盘卷数',
    zpjs	 INTEGER DEFAULT NULL COMMENT 	'照片卷数',
	lxjs	 INTEGER DEFAULT NULL COMMENT 	'录像卷数',
	sqsj	 DATETIME DEFAULT NULL COMMENT 	'申请时间',
	jsdwyj	 VARCHAR(255) DEFAULT NULL COMMENT 	'建设单位意见',
	jsdwyjrq	 DATETIME DEFAULT NULL COMMENT 	'建设单位意见日期',
	jldwyj	 VARCHAR(255) DEFAULT NULL COMMENT 	'监理单位意见',
	jldwyjrq	 DATETIME DEFAULT NULL COMMENT 	'监理单位意见日期',
	sgdwyj	 VARCHAR(255) DEFAULT NULL COMMENT 	'施工单位意见',
	sgdwyjrq	 DATETIME DEFAULT NULL COMMENT 	'施工单位意见日期',
	bz	 VARCHAR(255) DEFAULT NULL COMMENT 	'备注',
    PRIMARY KEY (sqbbh),
    FOREIGN KEY(xmh) REFERENCES lc_xm(xmh)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '预验收申请表';
-- ----------------------------
-- 5:Table structure for xt_wj T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_wj;
CREATE TABLE xt_wj (
    wjid	VARCHAR(32) NOT NULL COMMENT	'文件ID',
	mlm	VARCHAR(100) NOT NULL COMMENT	'目录名',
	bxwj	INT(1) NOT NULL COMMENT	'是否必须文件',
	jtwj	INT(2) NOT NULL COMMENT	'文件类型',
	sjml	VARCHAR(32) DEFAULT NULL COMMENT	'上级目录',
	wjzl    INT(2) NOT NULL COMMENT '文件种类',
    PRIMARY KEY (wjid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '文件';

-- ----------------------------
-- 6:Table structure for lc_xmwj T20160107
-- ----------------------------
DROP TABLE IF EXISTS lc_xmwj;
CREATE TABLE lc_xmwj (
    xmwjid	VARCHAR(32) NOT NULL COMMENT	'ID',
    xmh	VARCHAR(20) NOT NULL COMMENT	'项目号',
	smj	VARCHAR(100) DEFAULT NULL COMMENT	'对应扫描件',
	fj	VARCHAR(100) DEFAULT NULL COMMENT	'对应附件',
	wjm	VARCHAR(100) DEFAULT NULL COMMENT	'文件名',
	wjid	VARCHAR(32) NOT NULL COMMENT	'对应文件id',
	sqbsc	INT(1) NOT NULL COMMENT	'是否申请不上传',
	bscyj	VARCHAR(255) DEFAULT NULL COMMENT	'不上传理由',
	scsj	DATETIME NOT NULL COMMENT	'上传时间',
	scyh	VARCHAR(50) NOT NULL COMMENT	'上传用户',
    PRIMARY KEY (xmwjid),
    FOREIGN KEY(xmh) REFERENCES lc_xm(xmh),
    FOREIGN KEY(wjid) REFERENCES xt_wj(wjid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '项目文件';


-- ----------------------------
-- 7:Table structure for lc_mlxx T20160107
-- ----------------------------
DROP TABLE IF EXISTS lc_mlxx;
CREATE TABLE lc_mlxx (
    mlxxid	VARCHAR(32) NOT NULL COMMENT	'id',
    xmh     VARCHAR(20) NOT NULL COMMENT    '项目号',
	wjid	VARCHAR(32) NOT NULL COMMENT	'文件id',
	jh		VARCHAR(50) DEFAULT NULL COMMENT	'卷号',
	wjbh	VARCHAR(50) DEFAULT NULL COMMENT	'文件编号',
	ajtm	VARCHAR(50) DEFAULT NULL COMMENT	'案卷题名',
	dw	VARCHAR(50) DEFAULT NULL COMMENT	'单位',
	sj	DATETIME DEFAULT NULL COMMENT	'时间',
	ajys	INTEGER DEFAULT NULL COMMENT	'案卷页数',
	mj	INTEGER DEFAULT NULL COMMENT	'密级',
	bz	VARCHAR(255) DEFAULT NULL COMMENT	'备注',
    PRIMARY KEY (mlxxid),
    FOREIGN KEY(wjid) REFERENCES xt_wj(wjid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '目录信息';

-- ----------------------------
-- 8:Table structure for lc_jcjl T20160107
-- ----------------------------
DROP TABLE IF EXISTS lc_jcjl;
CREATE TABLE lc_jcjl (
    jcjlid	VARCHAR(32) NOT NULL COMMENT	'id',
	xmh	VARCHAR(20) NOT NULL COMMENT	'项目号',
	yhid	VARCHAR(32) NOT NULL COMMENT	'检查用户id',
	yhm	VARCHAR(50) NOT NULL COMMENT	'检查用户名称',
	jg	INT(1) NOT NULL COMMENT	'结果',
	rq	DATETIME NOT NULL COMMENT	'日期',
	jcyj	VARCHAR(255) DEFAULT NULL COMMENT	'检查意见',
	jclx	INT(2) NOT NULL COMMENT	'检查类型',
    PRIMARY KEY (jcjlid),
    FOREIGN KEY(xmh) REFERENCES lc_xm(xmh),
    FOREIGN KEY(yhid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '检查记录表';

-- ----------------------------
-- 9:Table structure for lc_wjjcjl T20160107
-- ----------------------------
DROP TABLE IF EXISTS lc_wjjcjl;
CREATE TABLE lc_wjjcjl (
 	wjjcjlid	VARCHAR(32) NOT NULL COMMENT	'id',
	jcjlid	VARCHAR(32) NOT NULL COMMENT	'检查记录id',
	xmwjid	VARCHAR(32) NOT NULL COMMENT	'检查文件id',
	wjm	VARCHAR(100) DEFAULT NULL COMMENT	'检查文件名称',
	jcyj	VARCHAR(255) DEFAULT NULL COMMENT	'检查意见',
	rq	DATETIME NOT NULL COMMENT	'日期',
    PRIMARY KEY (wjjcjlid),
    FOREIGN KEY(jcjlid) REFERENCES lc_jcjl(jcjlid),
    FOREIGN KEY(xmwjid) REFERENCES lc_xmwj(xmwjid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '文件检查记录';

-- ----------------------------
-- 10:Table structure for lc_jbshspjl T20160107
-- ----------------------------
DROP TABLE IF EXISTS lc_jbshspjl; 
CREATE TABLE lc_jbshspjl (
    jbshspjlid	VARCHAR(32) NOT NULL COMMENT	'id',
	xmh	VARCHAR(20) NOT NULL COMMENT	'项目号',
	yhid	VARCHAR(32) NOT NULL COMMENT	'办理人id',
	yhm	VARCHAR(50) DEFAULT NULL COMMENT	'办理人姓名',
	bljg	INT(1) NOT NULL COMMENT	'办理结果',
	blyj	VARCHAR(255) DEFAULT NULL COMMENT	'办理意见',
	blsj	DATETIME NOT NULL COMMENT	'办理时间',
	jllx	INT(2) NOT NULL COMMENT	'记录类型',
  	PRIMARY KEY (jbshspjlid),
  	FOREIGN KEY(xmh) REFERENCES lc_xm(xmh),
    FOREIGN KEY(yhid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '经办审核审批记录';

-- ----------------------------
-- 11:Table structure for lc_bsyysq T20160107
-- ----------------------------
DROP TABLE IF EXISTS lc_bsyysq;
CREATE TABLE lc_bsyysq (
    bsyysqid VARCHAR(32) NOT NULL COMMENT 'ID',
    xmh	VARCHAR(20) NOT NULL COMMENT	'项目号',
	gcmc	VARCHAR(50) NOT NULL COMMENT	'工程名称',
	yyzt	INT(1) NOT NULL COMMENT	'预约状态',
	yysj	DATETIME NOT NULL COMMENT	'预约时间',
	bz	VARCHAR(255) DEFAULT NULL COMMENT	'备注',
	FOREIGN KEY(xmh) REFERENCES lc_xm(xmh)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '报送预约申请';

-- ----------------------------
-- III1:Table structure for yh_lhjl T20160107
-- ----------------------------
DROP TABLE IF EXISTS yh_lhjl;
CREATE TABLE yh_lhjl (
	jlid	VARCHAR(32) NOT NULL COMMENT	'记录ID',
	czrid	VARCHAR(32) NOT NULL COMMENT	'操作人id',
	czr	    VARCHAR(50) NOT NULL COMMENT	'操作人名称',
	czrq	DATETIME NOT NULL COMMENT	'操作日期',
	czsj	VARCHAR(255) NOT NULL COMMENT	'操作事件',
	cznr	TEXT  NOT NULL COMMENT	'操作内容',
    PRIMARY KEY (jlid),
    FOREIGN KEY(czrid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '留痕记录表';


-- ----------------------------
-- III3:Table structure for xt_mb T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_mb;
CREATE TABLE xt_mb (
	mbid	VARCHAR(32) NOT NULL COMMENT	'模版id',
	mbmc	VARCHAR(50) NOT NULL COMMENT	'模版名称',
	mbnr	TEXT DEFAULT NULL COMMENT	'模版内容',
	mbfl	INT(3) NOT NULL COMMENT	'模版分类',
	cjrid	VARCHAR(32) NOT NULL COMMENT	'创建人id',
	cjrxm	VARCHAR(50) NOT NULL COMMENT	'创建人姓名',
	cjsj	DATETIME NOT NULL COMMENT	'创建时间',
	zhxgsj	DATETIME DEFAULT NULL COMMENT	'最后修改时间',
    PRIMARY KEY (mbid),
    FOREIGN KEY(cjrid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '模版表';

-- ----------------------------
-- III4:Table structure for xt_xx T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_xx;
CREATE TABLE xt_xx (
	xxid	VARCHAR(32) NOT NULL COMMENT	'消息id',
	xxnr	VARCHAR(255) NOT NULL COMMENT	'消息内容',
	fsrid	VARCHAR(32) NOT NULL COMMENT	'发送人id',
	fsr	VARCHAR(50) NOT NULL COMMENT	'发送人',
	jsrid	VARCHAR(32) DEFAULT NULL COMMENT	'接收人id',
	jsr	VARCHAR(50) NOT NULL COMMENT	'接收人',
	fssj	DATETIME NOT NULL COMMENT	'发送时间',
	sfyd	INT(1) NOT NULL COMMENT	'是否已读',
    PRIMARY KEY (xxid),
    FOREIGN KEY(jsrid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '消息表';

-- ----------------------------
-- III5:Table structure for xt_zx T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_zx;
CREATE TABLE xt_zx (
	zxid	varchar(32) NOT NULL COMMENT	'咨询id',
	zxzt	varchar(100) not NULL COMMENT	'咨询主题',
	zxnr	varchar(255) not NULL COMMENT	'咨询内容',
	zxsj	datetime not NULL COMMENT	'咨询时间',
	zxyhid	varchar(32) not NULL COMMENT	'咨询用户id',
	zxyhmc	varchar(50) not NULL COMMENT	'咨询用户名称',
	zxlx	int(2) not NULL COMMENT	'咨询类型',
	zxdxid	varchar(32) not NULL COMMENT	'咨询对象id',
	zxdx	varchar(50) not NULL COMMENT	'咨询对象',
	zt	int(11) not NULL COMMENT	'咨询状态',
    PRIMARY KEY (zxid),
    FOREIGN KEY(zxdxid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '咨询表';

-- ----------------------------
-- III6:Table structure for xt_zxhf T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_zxhf;
CREATE TABLE xt_zxhf (
	zxhfid	VARCHAR(32) NOT NULL COMMENT	'咨询回复id',
	zxid	VARCHAR(32) NOT NULL COMMENT	'咨询id',
	hfnr	VARCHAR(255) NOT NULL COMMENT	'回复内容',
	hfsj	DATETIME DEFAULT NULL COMMENT	'回复时间',
	hfrid	VARCHAR(32) NOT NULL COMMENT	'回复人id',
	hfrmc	VARCHAR(50) NOT NULL COMMENT	'回复人名称',
    PRIMARY KEY (zxhfid),
    FOREIGN KEY(zxid) REFERENCES xt_zx(zxid),
    FOREIGN KEY(hfrid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '咨询回复表';

-- ----------------------------
-- III7:Table structure for xt_fgzs T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_fgzs;
CREATE TABLE xt_fgzs (
	fgzskid	VARCHAR(32) NOT NULL COMMENT	'法规知识库id',
	bt	VARCHAR(100) NOT NULL COMMENT	'标题',
	nr	TEXT NOT NULL COMMENT	'内容',
	lx	INT(2) NOT NULL COMMENT	'类型',
	cjsj	DATETIME NOT NULL COMMENT	'创建时间',
	cjrid	VARCHAR(32) NOT NULL COMMENT	'创建人id',
	cjr	VARCHAR(50) DEFAULT NULL COMMENT	'创建人',
	llcs	INTEGER DEFAULT NULL COMMENT	'浏览次数',
    PRIMARY KEY (fgzskid),
    FOREIGN KEY(cjrid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '法规知识库表';

-- ----------------------------
-- III8:Table structure for xt_xmxg T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_xmxg;
CREATE TABLE xt_xmxg (
	xmxgsqid	VARCHAR(32) NOT NULL COMMENT	'项目修改申请id',
	xmh	VARCHAR(32) NOT NULL COMMENT	'项目号',
	xggcm	VARCHAR(50) NOT NULL COMMENT	'修改工程名',
	xggcdz	VARCHAR(100) NOT NULL COMMENT	'修改工程地址',
	sqsj	DATETIME NOT NULL COMMENT	'申请时间',
	sqyhid	VARCHAR(32) NOT NULL COMMENT	'申请用户id',
	sqyhmc	VARCHAR(50) NOT NULL COMMENT	'申请用户名称',
	zt	INT(1) NOT NULL COMMENT	'状态',
	dsfxgyj	VARCHAR(255) DEFAULT NULL COMMENT	'第三方修改意见',
	fsdxid	VARCHAR(32) NOT NULL COMMENT	'发送对象id',
	fadxmc	VARCHAR(50) NOT NULL COMMENT	'发送对象名称',
    PRIMARY KEY (xmxgsqid),
    FOREIGN KEY(fsdxid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '项目修改申请表';

-- ----------------------------
-- III9:Table structure for xt_xczdsq T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_xczdsq;
CREATE TABLE xt_xczdsq (
	xczdsqid	VARCHAR(32) NOT NULL COMMENT	'现场指导申请id',
	zt	VARCHAR(100) NOT NULL COMMENT	'主题',
	yysj	DATETIME NOT NULL COMMENT	'预约时间',
	dz	VARCHAR(100) DEFAULT NULL COMMENT	'地址',
	yy	VARCHAR(255) DEFAULT NULL COMMENT	'原因',
	lb	INT(2) NOT NULL COMMENT	'类别',
	bz	VARCHAR(255) DEFAULT NULL COMMENT	'备注',
	sqyhid	VARCHAR(32) NOT NULL COMMENT	'申请用户id',
	sqyhmc	VARCHAR(50) NOT NULL COMMENT	'申请用户名称',
	sqsj	DATETIME NOT NULL COMMENT	'申请时间',
	sqzt	INT(1) NOT NULL COMMENT	'申请状态',
    PRIMARY KEY (xczdsqid),
    FOREIGN KEY(sqyhid) REFERENCES yh_yh(yhid)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '现场指导申请表';

-- ----------------------------
-- III10:Table structure for xt_xmjjjl T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_xmjjjl;
CREATE TABLE xt_xmjjjl (
	jjjlid	VARCHAR(32) NOT NULL COMMENT	'交接记录id',
	jjxmh	VARCHAR(20) DEFAULT NULL COMMENT	'交接项目号',
	yfzrid	VARCHAR(32) DEFAULT NULL COMMENT	'原负责人id',
	yfzrmc	VARCHAR(50) DEFAULT NULL COMMENT	'原负责人名称',
	xfzrid	VARCHAR(32) DEFAULT NULL COMMENT	'新负责人id',
	xfzrmc	VARCHAR(50) DEFAULT NULL COMMENT	'新负责人名称',
	jjsj	DATETIME DEFAULT NULL COMMENT	'交接时间',
	jjyy	VARCHAR(255) DEFAULT NULL COMMENT	'交接原因',
	jjzt	INT(2) DEFAULT NULL COMMENT	'交接状态',
    PRIMARY KEY (jjjlid),
    FOREIGN KEY(jjxmh) REFERENCES lc_xm(xmh)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '项目交接记录表';

-- ----------------------------
-- III11:Table structure for xt_xmhgz T20160107
-- ----------------------------
DROP TABLE IF EXISTS xt_xmhgz;
CREATE TABLE xt_xmhgz (
	lx	INTEGER DEFAULT NULL COMMENT	'类型',
	rq	DATE DEFAULT NULL COMMENT	'日期',
	bh	INTEGER DEFAULT NULL COMMENT	'编号'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '主键生成策略表';

-- ----------------------------
DROP TABLE IF EXISTS `flow_flowdata`;
CREATE TABLE `flow_flowdata` (
  `flowkey` varchar(33) NOT NULL,
  `founder` varchar(50) DEFAULT NULL COMMENT '创建人',
  `jsondata` text,
  `xmldata` text,
  `createdate` datetime DEFAULT NULL,
  `lastdate` datetime DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `flowname` varchar(100) DEFAULT NULL,
  `entrance` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`flowkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_flowdata
-- ----------------------------
INSERT INTO `flow_flowdata` VALUES ('Z6786092b37d6430982f2eda971e3528b', null, '{\"class\":\"go.GraphLinksModel\",\"linkFromPortIdProperty\":\"fromPort\",\"linkToPortIdProperty\":\"toPort\",\"nodeDataArray\":[{\"category\":\"Start\",\"text\":\"开始\",\"key\":-1,\"loc\":\"-57.546875 -323\"},{\"text\":\"建档立项申请\",\"key\":-2,\"loc\":\"-57.546875 -237\"},{\"text\":\"指派经办人(工程案)\",\"key\":-3,\"loc\":\"-246.546875 -152\"},{\"text\":\"指派经办人(工程声像案)\",\"key\":-4,\"loc\":\"114.453125 -151\"},{\"text\":\"符合必须按表条件\",\"key\":-5,\"loc\":\"-60.546875 -62\"},{\"text\":\"普通文件上传资料\",\"key\":-6,\"loc\":\"-60.546875 31\"},{\"text\":\"指派第三方\",\"key\":-7,\"loc\":\"-60.546875 119\"},{\"text\":\"预验收检查\",\"key\":-8,\"loc\":\"-60.546875 212\"},{\"text\":\"预验收复查\",\"key\":-10,\"loc\":\"-60.546875 295\"},{\"text\":\"预验收复核\",\"figure\":\"Diamond\",\"key\":-14,\"loc\":\"-62.546875 398\"},{\"text\":\"经办人确认\",\"figure\":\"Diamond\",\"key\":-15,\"loc\":\"-64.546875 514\"},{\"text\":\"预验收受理申请\",\"key\":-16,\"loc\":\"-62.546875 623\"},{\"text\":\"预验收受理并经办(工程案)\",\"key\":-19,\"loc\":\"-247.546875 949\"},{\"text\":\"预验收受理并经办(工程声像案)\",\"key\":-20,\"loc\":\"151.453125 951\"},{\"text\":\"预验收审核(工程案)\",\"key\":-21,\"loc\":\"-247.546875 1056\"},{\"text\":\"预验收审核(工程案)\",\"key\":-22,\"loc\":\"151.453125 1058\"},{\"text\":\"预验收审批\",\"figure\":\"Diamond\",\"key\":-23,\"loc\":\"-60.546875 1158\"},{\"text\":\"签发预验收认可书\",\"key\":-24,\"loc\":\"-61.546875 1263\"},{\"category\":\"End\",\"text\":\"结束\",\"key\":-25,\"loc\":\"-61.546875 1344\"}],\"linkDataArray\":[{\"from\":-1,\"to\":-2,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-57.54687500000001,-300.77569828477016,-57.54687500000001,-290.77569828477016,-57.54687500000001,-278.41856101696203,-57.54687500000001,-278.41856101696203,-57.54687500000001,-266.06142374915396,-57.54687500000001,-256.06142374915396],\"lid\":1220},{\"from\":-2,\"to\":-3,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-57.54687500000001,-217.93857625084604,-57.54687500000001,-207.93857625084604,-57.54687500000001,-194.5,-246.546875,-194.5,-246.546875,-181.06142374915396,-246.546875,-171.06142374915396],\"lid\":1221},{\"from\":-2,\"to\":-4,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-57.54687500000001,-217.93857625084604,-57.54687500000001,-207.93857625084604,-57.54687500000001,-194,114.453125,-194,114.453125,-180.06142374915396,114.453125,-170.06142374915396],\"lid\":1222},{\"from\":-3,\"to\":-5,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-246.546875,-132.93857625084604,-246.546875,-122.93857625084604,-246.546875,-107,-60.546874999999986,-107,-60.546874999999986,-91.06142374915396,-60.546874999999986,-81.06142374915396],\"lid\":1223},{\"from\":-4,\"to\":-5,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[114.453125,-131.93857625084604,114.453125,-121.93857625084604,114.453125,-106.5,-60.546874999999986,-106.5,-60.546874999999986,-91.06142374915396,-60.546874999999986,-81.06142374915396],\"lid\":1224},{\"from\":-5,\"to\":-6,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-60.546874999999986,-42.938576250846026,-60.546874999999986,-32.938576250846026,-60.546874999999986,-15.499999999999996,-60.546874999999986,-15.499999999999996,-60.546874999999986,1.9385762508460331,-60.546874999999986,11.938576250846033],\"lid\":1225},{\"from\":-6,\"to\":-7,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-60.546874999999986,50.06142374915397,-60.546874999999986,60.06142374915397,-60.546874999999986,75,-60.546875,75,-60.546875,89.93857625084604,-60.546875,99.93857625084604],\"lid\":1226},{\"from\":-7,\"to\":-8,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-60.546875,138.06142374915396,-60.546875,148.06142374915396,-60.546875,165.5,-60.546875,165.5,-60.546875,182.938576250846,-60.546875,192.938576250846],\"lid\":1227},{\"from\":-8,\"to\":-10,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-60.546875,231.06142374915396,-60.546875,241.06142374915396,-60.546875,253.5,-60.546875,253.5,-60.546875,265.93857625084604,-60.546875,275.93857625084604],\"lid\":1228},{\"from\":-10,\"to\":-14,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-60.546875,314.06142374915396,-60.546875,324.06142374915396,-60.546875,339.98071187457697,-62.546875,339.98071187457697,-62.546875,355.8999999999999,-62.546875,365.8999999999999],\"lid\":1229},{\"from\":-14,\"to\":-15,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-62.546875,430.0999999999999,-62.546875,440.0999999999999,-62.546875,455.99999999999994,-64.546875,455.99999999999994,-64.546875,471.9,-64.546875,481.9],\"text\":\"通过\",\"lid\":1230},{\"from\":-15,\"to\":-16,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-64.546875,546.1,-64.546875,556.1,-64.546875,575.019288125423,-62.546875,575.019288125423,-62.546875,593.938576250846,-62.546875,603.938576250846],\"text\":\"通过\",\"lid\":1231},{\"from\":-19,\"to\":-21,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-247.546875,975.8614237491539,-247.546875,985.8614237491539,-247.546875,1006.4000000000001,-247.54687499999994,1006.4000000000001,-247.54687499999994,1026.9385762508462,-247.54687499999994,1036.9385762508462],\"lid\":1232},{\"from\":-20,\"to\":-22,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[151.453125,977.8614237491539,151.453125,987.8614237491539,151.453125,1008.3999999999999,151.453125,1008.3999999999999,151.453125,1028.938576250846,151.453125,1038.938576250846],\"lid\":1233},{\"from\":-21,\"to\":-23,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-247.54687499999994,1075.061423749154,-247.54687499999994,1085.061423749154,-247.54687499999994,1100.480711874577,-60.54687500000003,1100.480711874577,-60.54687500000003,1115.9,-60.54687500000003,1125.9],\"lid\":1234},{\"from\":-22,\"to\":-23,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[151.453125,1077.0614237491538,151.453125,1087.0614237491538,151.453125,1101.480711874577,-60.54687500000003,1101.480711874577,-60.54687500000003,1115.9,-60.54687500000003,1125.9],\"lid\":1235},{\"from\":-23,\"to\":-24,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-60.54687500000003,1190.1000000000001,-60.54687500000003,1200.1000000000001,-60.54687500000003,1217.019288125423,-61.546874999999986,1217.019288125423,-61.546874999999986,1233.938576250846,-61.546874999999986,1243.938576250846],\"lid\":1236,\"text\":\"通过\"},{\"from\":-24,\"to\":-25,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-61.546874999999986,1282.0614237491538,-61.546874999999986,1292.0614237491538,-61.546874999999986,1301.918561016962,-61.546875,1301.918561016962,-61.546875,1311.7756982847702,-61.546875,1321.7756982847702],\"lid\":1245},{\"from\":-14,\"to\":-5,\"fromPort\":\"L\",\"toPort\":\"L\",\"visible\":true,\"points\":[-154.046875,397.99999999999994,-164.046875,397.99999999999994,-202,397.99999999999994,-202,-62,-141.80829874915395,-62,-131.80829874915395,-62],\"lid\":1238,\"text\":\"不通过\"},{\"from\":-15,\"to\":-14,\"fromPort\":\"R\",\"toPort\":\"R\",\"visible\":true,\"points\":[26.953125,514,36.953125,514,52,514,52,397.99999999999994,38.953125,397.99999999999994,28.953125,397.99999999999994],\"text\":\"不通过\",\"lid\":1239},{\"from\":-23,\"to\":-16,\"fromPort\":\"L\",\"toPort\":\"L\",\"visible\":true,\"points\":[-152.04687500000003,1158,-162.04687500000003,1158,-386,1158,-386,623,-136.30829874915398,623,-126.30829874915398,623],\"text\":\"不通过\",\"lid\":1240},{\"from\":-16,\"to\":-19,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-62.546875,642.061423749154,-62.546875,652.061423749154,-62.546875,782.0999999999999,-247.54687500000006,782.0999999999999,-247.54687500000006,912.138576250846,-247.54687500000006,922.138576250846],\"lid\":1241},{\"from\":-16,\"to\":-20,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-62.546875,642.061423749154,-62.546875,652.061423749154,-62.546875,783.1000000000001,151.45312499999997,783.1000000000001,151.45312499999997,914.1385762508462,151.45312499999997,924.1385762508462],\"lid\":1242}],\"nodeDatas\":[{\"key\":-2,\"userrole\":\"8\",\"role\":null,\"inform\":\"19\",\"outform\":\"\",\"rkdzkf\":false,\"cjfz\":true,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-3,\"userrole\":\"\",\"role\":\"2\",\"inform\":\"20\",\"outform\":\"36#38\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-4,\"userrole\":\"\",\"role\":\"19\",\"inform\":\"21\",\"outform\":\"36#38\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-5,\"userrole\":\"8\",\"role\":null,\"inform\":\"25\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\",\"hhfzLinkIds\":[\"1223\",\"1224\"],\"hhfz\":true,\"outform\":\"38#\"},{\"key\":-6,\"userrole\":\"8\",\"role\":null,\"inform\":\"24\",\"outform\":\"36#38\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-7,\"userrole\":\"1\",\"role\":null,\"inform\":\"22\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\",\"outform\":\"36#38#39\"},{\"key\":-8,\"userrole\":\"10\",\"role\":null,\"inform\":\"28\",\"outform\":\"36#38#39\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-10,\"userrole\":\"\",\"role\":\"11\",\"inform\":\"29\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-14,\"userrole\":\"\",\"role\":\"12\",\"inform\":\"30\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\",\"hhfzLinkIds\":[\"31706\",\"31966\"],\"hhfz\":true},{\"key\":-15,\"userrole\":\"1\",\"role\":null,\"inform\":\"37\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-16,\"userrole\":\"8\",\"role\":null,\"inform\":\"23\",\"rkdzkf\":false,\"cjfz\":true,\"prelistener\":\"\",\"afterlistener\":\"\",\"outform\":\"36#38#39#41\"},{\"key\":-19,\"userrole\":\"1\",\"role\":null,\"inform\":\"33\",\"rkdzkf\":false,\"cjfz\":true,\"prelistener\":\"\",\"afterlistener\":\"\",\"cjfzLinkIds\":[\"1239\"],\"outform\":\"31#36#38#39#41\"},{\"key\":-20,\"userrole\":\"18\",\"role\":null,\"inform\":\"33\",\"rkdzkf\":false,\"cjfz\":true,\"prelistener\":\"\",\"afterlistener\":\"\",\"cjfzLinkIds\":[\"1239\"],\"outform\":\"31#36#38#39#41\"},{\"key\":-21,\"userrole\":\"\",\"role\":\"2\",\"inform\":\"34\",\"rkdzkf\":false,\"cjfz\":true,\"prelistener\":\"\",\"afterlistener\":\"\",\"outform\":\"31#36#38#39#41\",\"cjfzLinkIds\":[\"1239\"]},{\"key\":-22,\"userrole\":\"\",\"role\":\"19\",\"inform\":\"34\",\"rkdzkf\":false,\"cjfz\":true,\"prelistener\":\"\",\"afterlistener\":\"\",\"outform\":\"31#36#38#39#41\",\"cjfzLinkIds\":[\"1239\"]},{\"key\":-23,\"userrole\":\"\",\"role\":\"7\",\"inform\":\"35\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\",\"hhfzLinkIds\":[\"1234\",\"1235\"],\"hhfz\":true,\"outform\":\"31#36#38#39#41\"},{\"key\":-24,\"userrole\":\"\",\"role\":\"13\",\"inform\":\"26\",\"outform\":\"\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-25,\"startflow\":\"Zdc6a04a36a094ebaa186db845f180b53\"}]}', '<?xml version=\"1.0\" encoding=\"UTF-8\"?><definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\"><process id=\"Z6786092b37d6430982f2eda971e3528b\" isExecutable=\"true\"><startEvent name=\"开始\" id=\"startevent-1.0\"><extensionElements/></startEvent><userTask name=\"建档立项申请\" activiti:assignee=\"ROLE(8)#sd#\" id=\"usertask-2.0\"><documentation><![CDATA[{\"inform\":\"19\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"指派经办人(工程案)\" activiti:assignee=\"ROLE(2)\" id=\"usertask-3.0\"><documentation><![CDATA[{\"inform\":\"20\",\"outform\":\"36#38\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"指派经办人(工程声像案)\" activiti:assignee=\"ROLE(19)\" id=\"usertask-4.0\"><documentation><![CDATA[{\"inform\":\"21\",\"outform\":\"36#38\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"符合必须按表条件\" activiti:assignee=\"ROLE(8)#sd#\" id=\"usertask-5.0\"><documentation><![CDATA[{\"inform\":\"25\",\"outform\":\"38#\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"普通文件上传资料\" activiti:assignee=\"ROLE(8)#sd#\" id=\"usertask-6.0\"><documentation><![CDATA[{\"inform\":\"24\",\"outform\":\"36#38\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"指派第三方\" activiti:assignee=\"ROLE(1)#sd#\" id=\"usertask-7.0\"><documentation><![CDATA[{\"inform\":\"22\",\"outform\":\"36#38#39\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收检查\" activiti:assignee=\"ROLE(10)#sd#\" id=\"usertask-8.0\"><documentation><![CDATA[{\"inform\":\"28\",\"outform\":\"36#38#39\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收复查\" activiti:assignee=\"ROLE(11)\" id=\"usertask-10.0\"><documentation><![CDATA[{\"inform\":\"29\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收复核\" activiti:assignee=\"ROLE(12)\" id=\"usertask-14.0\"><documentation><![CDATA[{\"inform\":\"30\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"经办人确认\" activiti:assignee=\"ROLE(1)#sd#\" id=\"usertask-15.0\"><documentation><![CDATA[{\"inform\":\"37\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收受理申请\" activiti:assignee=\"ROLE(8)#sd#\" id=\"usertask-16.0\"><documentation><![CDATA[{\"inform\":\"23\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收受理并经办(工程案)\" activiti:assignee=\"ROLE(1)#sd#\" id=\"usertask-19.0\"><documentation><![CDATA[{\"inform\":\"33\",\"outform\":\"31#36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收受理并经办(工程声像案)\" activiti:assignee=\"ROLE(18)#sd#\" id=\"usertask-20.0\"><documentation><![CDATA[{\"inform\":\"33\",\"outform\":\"31#36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收审核(工程案)\" activiti:assignee=\"ROLE(2)\" id=\"usertask-21.0\"><documentation><![CDATA[{\"inform\":\"34\",\"outform\":\"31#36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收审核(工程案)\" activiti:assignee=\"ROLE(19)\" id=\"usertask-22.0\"><documentation><![CDATA[{\"inform\":\"34\",\"outform\":\"31#36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"预验收审批\" activiti:assignee=\"ROLE(7)\" id=\"usertask-23.0\"><documentation><![CDATA[{\"inform\":\"35\",\"outform\":\"31#36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"签发预验收认可书\" activiti:assignee=\"ROLE(13)\" id=\"usertask-24.0\"><documentation><![CDATA[{\"inform\":\"26\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><endEvent name=\"结束\" id=\"endevent-25.0\"><documentation><![CDATA[{\"startflow\":\"Zdc6a04a36a094ebaa186db845f180b53\"}]]></documentation><extensionElements><activiti:executionListener event=\"end\" class=\"com.sd.ubarchive.web.common.linstener.flow.StartProcessListener\"/></extensionElements></endEvent><sequenceFlow id=\"flow2\" sourceRef=\"startevent-1.0\" targetRef=\"usertask-2.0\"/><parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow25\" sourceRef=\"usertask-2.0\" targetRef=\"parallelgateway1\"/><sequenceFlow id=\"flow3\" sourceRef=\"parallelgateway1\" targetRef=\"usertask-3.0\"/><sequenceFlow id=\"flow4\" sourceRef=\"parallelgateway1\" targetRef=\"usertask-4.0\"/><parallelGateway id=\"parallelgateway2\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow26\" targetRef=\"usertask-5.0\" sourceRef=\"parallelgateway2\"/><sequenceFlow id=\"flow5\" sourceRef=\"usertask-3.0\" targetRef=\"parallelgateway2\"/><sequenceFlow id=\"flow6\" sourceRef=\"usertask-4.0\" targetRef=\"parallelgateway2\"/><sequenceFlow id=\"flow7\" sourceRef=\"usertask-5.0\" targetRef=\"usertask-6.0\"/><sequenceFlow id=\"flow8\" sourceRef=\"usertask-6.0\" targetRef=\"usertask-7.0\"/><sequenceFlow id=\"flow9\" sourceRef=\"usertask-7.0\" targetRef=\"usertask-8.0\"/><sequenceFlow id=\"flow10\" sourceRef=\"usertask-8.0\" targetRef=\"usertask-10.0\"/><parallelGateway id=\"parallelgateway3\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow27\" targetRef=\"usertask-14.0\" sourceRef=\"parallelgateway3\"/><sequenceFlow id=\"flow11\" sourceRef=\"usertask-10.0\" targetRef=\"usertask-14.0\"/><sequenceFlow id=\"flow12\" sourceRef=\"usertask-14.0\" targetRef=\"usertask-15.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow12\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow13\" sourceRef=\"usertask-15.0\" targetRef=\"usertask-16.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow13\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><parallelGateway id=\"parallelgateway4\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow28\" sourceRef=\"usertask-19.0\" targetRef=\"parallelgateway4\"/><sequenceFlow id=\"flow14\" sourceRef=\"usertask-19.0\" targetRef=\"usertask-21.0\"/><parallelGateway id=\"parallelgateway5\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow29\" sourceRef=\"usertask-20.0\" targetRef=\"parallelgateway5\"/><sequenceFlow id=\"flow15\" sourceRef=\"usertask-20.0\" targetRef=\"usertask-22.0\"/><parallelGateway id=\"parallelgateway6\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow30\" sourceRef=\"usertask-21.0\" targetRef=\"parallelgateway6\"/><parallelGateway id=\"parallelgateway7\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow31\" targetRef=\"usertask-23.0\" sourceRef=\"parallelgateway7\"/><sequenceFlow id=\"flow16\" sourceRef=\"usertask-21.0\" targetRef=\"parallelgateway7\"/><parallelGateway id=\"parallelgateway8\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow32\" sourceRef=\"usertask-22.0\" targetRef=\"parallelgateway8\"/><sequenceFlow id=\"flow17\" sourceRef=\"usertask-22.0\" targetRef=\"parallelgateway7\"/><sequenceFlow id=\"flow18\" sourceRef=\"usertask-23.0\" targetRef=\"usertask-24.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow18\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow19\" sourceRef=\"usertask-24.0\" targetRef=\"endevent-25.0\"/><sequenceFlow id=\"flow20\" sourceRef=\"usertask-14.0\" targetRef=\"usertask-5.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow20\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow21\" sourceRef=\"usertask-15.0\" targetRef=\"usertask-14.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow21\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow22\" sourceRef=\"usertask-23.0\" targetRef=\"usertask-16.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow22\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow><parallelGateway id=\"parallelgateway9\" name=\"Parallel Gateway\"/><sequenceFlow id=\"flow33\" sourceRef=\"usertask-16.0\" targetRef=\"parallelgateway9\"/><sequenceFlow id=\"flow23\" sourceRef=\"parallelgateway9\" targetRef=\"usertask-19.0\"/><sequenceFlow id=\"flow24\" sourceRef=\"parallelgateway9\" targetRef=\"usertask-20.0\"/></process></definitions>', '2016-01-19 11:18:04', '2016-01-29 14:52:21', '已发布', '预验收流程（合并版）', '1');
INSERT INTO `flow_flowdata` VALUES ('Zdc6a04a36a094ebaa186db845f180b53', null, '{\"class\":\"go.GraphLinksModel\",\"linkFromPortIdProperty\":\"fromPort\",\"linkToPortIdProperty\":\"toPort\",\"nodeDataArray\":[{\"category\":\"Start\",\"text\":\"开始\",\"key\":-1,\"loc\":\"-147.546875 -327.9999999999999\"},{\"text\":\"补充项目信息\",\"key\":-2,\"loc\":\"-147.546875 -245\"},{\"text\":\"普通文件上传资料\",\"key\":-3,\"loc\":\"-147.5468749999999 -164.00000000000003\"},{\"text\":\"符合性检查\",\"key\":-4,\"loc\":\"-147.5468750000001 -87.99999999999993\"},{\"text\":\"符合性复查\",\"key\":-5,\"loc\":\"-147.54687499999991 -12.999999999999996\"},{\"text\":\"符合性复核\",\"figure\":\"Diamond\",\"key\":-6,\"loc\":\"-147.54687500000014 75.99999999999994\"},{\"text\":\"提交档案报送预约\",\"key\":-7,\"loc\":\"-145.5468750000001 171.99999999999997\"},{\"text\":\"一致性检查\",\"key\":-8,\"loc\":\"-145.546875 353\"},{\"text\":\"签发验收合格证\",\"key\":-9,\"loc\":\"-145.54687500000026 1519.0000000000004\"},{\"text\":\"一致性复查\",\"key\":-10,\"loc\":\"-145.546875 438.99999999999994\"},{\"text\":\"一致性复核\",\"figure\":\"Diamond\",\"key\":-11,\"loc\":\"-145.54687499999997 552.0000000000002\"},{\"text\":\"合格证办理(工程声像案)\",\"figure\":\"Diamond\",\"key\":-15,\"loc\":\"-144.54687499999994 1004\"},{\"text\":\"合格证办理(工程案)\",\"figure\":\"Diamond\",\"key\":-16,\"loc\":\"-147.546875 1143\"},{\"text\":\"合格证审核(工程声像案)\",\"key\":-17,\"loc\":\"-145.5468749999999 1238\"},{\"text\":\"合格证审核(工程案)\",\"key\":-18,\"loc\":\"-145.54687499999997 1330.9999999999997\"},{\"category\":\"End\",\"text\":\"结束\",\"key\":-20,\"loc\":\"-145.54687500000003 1615\"},{\"text\":\"合格证审批\",\"figure\":\"Diamond\",\"key\":-19,\"loc\":\"-145.54687500000006 1429\"},{\"text\":\"经办人预约确认\",\"key\":-21,\"loc\":\"-146 264\"},{\"text\":\"立案申请\",\"key\":-22,\"loc\":\"-143.546875 709\"},{\"text\":\"经办人确认立案\",\"figure\":\"Diamond\",\"key\":-23,\"loc\":\"-144.546875 820\"}],\"linkDataArray\":[{\"from\":-1,\"to\":-2,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-147.546875,-305.77569828477015,-147.546875,-295.77569828477015,-147.546875,-284.91856101696203,-147.546875,-284.91856101696203,-147.546875,-274.06142374915396,-147.546875,-264.06142374915396],\"lid\":1218},{\"from\":-2,\"to\":-3,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-147.546875,-225.93857625084604,-147.546875,-215.93857625084604,-147.546875,-204.5,-147.546875,-204.5,-147.546875,-193.06142374915396,-147.546875,-183.06142374915396],\"lid\":1219},{\"from\":-3,\"to\":-4,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-147.546875,-144.93857625084604,-147.546875,-134.93857625084604,-147.546875,-126,-147.546875,-126,-147.546875,-117.06142374915396,-147.546875,-107.06142374915396],\"lid\":1220},{\"from\":-4,\"to\":-5,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-147.546875,-68.93857625084602,-147.546875,-58.938576250846026,-147.546875,-50.5,-147.546875,-50.5,-147.546875,-42.06142374915397,-147.546875,-32.06142374915397],\"lid\":1219},{\"from\":-5,\"to\":-6,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-147.546875,6.061423749153967,-147.546875,16.061423749153967,-147.546875,24.980711874576982,-147.546875,24.980711874576982,-147.546875,33.9,-147.546875,43.9],\"lid\":1222},{\"from\":-6,\"to\":-7,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-147.546875,108.1,-147.546875,118.1,-147.546875,130.51928812542303,-145.546875,130.51928812542303,-145.546875,142.93857625084604,-145.546875,152.93857625084604],\"lid\":1223,\"text\":\"通过\"},{\"from\":-8,\"to\":-10,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-145.546875,372.06142374915396,-145.546875,382.06142374915396,-145.546875,396,-145.546875,396,-145.546875,409.938576250846,-145.546875,419.938576250846],\"lid\":1223},{\"from\":-10,\"to\":-11,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-145.546875,458.0614237491539,-145.546875,468.0614237491539,-145.546875,488.98071187457697,-145.546875,488.98071187457697,-145.546875,509.9000000000001,-145.546875,519.9000000000001],\"lid\":1230},{\"from\":-15,\"to\":-16,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-144.546875,1036.1,-144.546875,1046.1,-144.546875,1073.5,-147.546875,1073.5,-147.546875,1100.9,-147.546875,1110.9],\"lid\":1226,\"text\":\"通过\"},{\"from\":-16,\"to\":-17,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-147.546875,1175.1,-147.546875,1185.1,-147.546875,1197.019288125423,-145.546875,1197.019288125423,-145.546875,1208.938576250846,-145.546875,1218.938576250846],\"lid\":1227,\"text\":\"通过\"},{\"from\":-17,\"to\":-18,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-145.546875,1257.0614237491536,-145.546875,1267.0614237491536,-145.546875,1284.5,-145.546875,1284.5,-145.546875,1301.9385762508463,-145.546875,1311.9385762508463],\"lid\":1228},{\"from\":-9,\"to\":-20,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-145.54687500000028,1538.0614237491536,-145.54687500000028,1548.0614237491536,-145.54687500000028,1565.418561016962,-145.546875,1565.418561016962,-145.546875,1582.7756982847702,-145.546875,1592.7756982847702],\"lid\":1229},{\"from\":-6,\"to\":-2,\"fromPort\":\"L\",\"toPort\":\"L\",\"visible\":true,\"points\":[-238.77847290039062,76,-248.77847290039062,76,-270.546875,76,-270.546875,-245,-213.64725748938835,-245,-203.64725748938835,-245],\"lid\":1230,\"text\":\"不通过\"},{\"from\":-11,\"to\":-2,\"fromPort\":\"R\",\"toPort\":\"R\",\"visible\":true,\"points\":[-54.046875,552.0000000000001,-44.046875,552.0000000000001,-13,552.0000000000001,-13,-245,-81.28545125084604,-245,-91.28545125084604,-245],\"lid\":1236,\"text\":\"不通过\"},{\"from\":-15,\"to\":-11,\"fromPort\":\"L\",\"toPort\":\"L\",\"visible\":true,\"points\":[-320.51007080078125,1004,-330.51007080078125,1004,-343.546875,1004,-343.546875,552.0000000000002,-246.7784729003906,552.0000000000002,-236.7784729003906,552.0000000000002],\"text\":\"不通过\",\"lid\":1237},{\"from\":-16,\"to\":-11,\"fromPort\":\"L\",\"toPort\":\"L\",\"visible\":true,\"points\":[-293.617431640625,1143,-303.617431640625,1143,-394.546875,1143,-394.546875,552.0000000000002,-246.7784729003906,552.0000000000002,-236.7784729003906,552.0000000000002],\"text\":\"不通过\",\"lid\":1238},{\"from\":-18,\"to\":-19,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-145.546875,1350.0614237491543,-145.546875,1360.0614237491543,-145.546875,1373.480711874577,-145.546875,1373.480711874577,-145.546875,1386.8999999999998,-145.546875,1396.8999999999998],\"lid\":1234},{\"from\":-19,\"to\":-9,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-145.546875,1461.1,-145.546875,1471.1,-145.546875,1480.519288125423,-145.54687500000028,1480.519288125423,-145.54687500000028,1489.9385762508457,-145.54687500000028,1499.9385762508457],\"text\":\"通过\",\"lid\":1235},{\"from\":-19,\"to\":-11,\"fromPort\":\"L\",\"toPort\":\"L\",\"visible\":true,\"points\":[-236.77847290039062,1429,-246.77847290039062,1429,-475.046875,1429,-475.046875,552.0000000000002,-246.7784729003906,552.0000000000002,-236.7784729003906,552.0000000000002],\"text\":\"不通过\",\"lid\":1241},{\"from\":-11,\"to\":-22,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-145.54687499999997,584.1000000000002,-145.54687499999997,594.1000000000002,-145.54687499999997,637.0192881254231,-143.546875,637.0192881254231,-143.546875,679.938576250846,-143.546875,689.938576250846],\"lid\":1242,\"text\":\"通过\"},{\"from\":-7,\"to\":-21,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-145.5468750000001,191.06142374915396,-145.5468750000001,201.06142374915396,-145.5468750000001,218,-146,218,-146,234.93857625084604,-146,244.93857625084604],\"lid\":1238},{\"from\":-21,\"to\":-8,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-146,283.06142374915396,-146,293.06142374915396,-146,308.5,-145.546875,308.5,-145.546875,323.93857625084604,-145.546875,333.93857625084604],\"lid\":1239},{\"from\":-22,\"to\":-23,\"fromPort\":\"B\",\"toPort\":\"T\",\"points\":[-143.546875,728.061423749154,-143.546875,738.061423749154,-143.546875,757.980711874577,-144.546875,757.980711874577,-144.546875,777.9,-144.546875,787.9],\"lid\":1245},{\"from\":-23,\"to\":-15,\"fromPort\":\"B\",\"toPort\":\"T\",\"visible\":true,\"points\":[-144.546875,852.1,-144.546875,862.1,-144.546875,912,-144.546875,912,-144.546875,961.9,-144.546875,971.9],\"lid\":1246,\"text\":\"通过\"},{\"from\":-23,\"to\":-22,\"fromPort\":\"R\",\"toPort\":\"R\",\"visible\":true,\"points\":[-23.422637939453125,820,-13.422637939453125,820,6.453125,820,6.453125,709,-92.39281209068979,709,-102.39281209068979,709],\"text\":\"不通过\",\"lid\":1247}],\"nodeDatas\":[{\"key\":-2,\"userrole\":\"8\",\"role\":null,\"inform\":\"40\",\"outform\":\"41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-3,\"userrole\":\"8\",\"role\":null,\"inform\":\"24\",\"outform\":\"36#38#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-4,\"userrole\":\"10\",\"role\":null,\"inform\":\"42\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-5,\"userrole\":\"\",\"role\":\"11\",\"inform\":\"43\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-6,\"userrole\":\"\",\"role\":\"12\",\"inform\":\"44\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-7,\"userrole\":\"8\",\"role\":null,\"inform\":\"51\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-8,\"userrole\":\"10\",\"role\":null,\"inform\":\"45\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-10,\"userrole\":\"\",\"role\":\"11\",\"inform\":\"46\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-11,\"userrole\":\"\",\"role\":\"12\",\"inform\":\"47\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-15,\"userrole\":\"18\",\"role\":null,\"inform\":\"48\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-16,\"userrole\":\"1\",\"role\":null,\"inform\":\"48\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-17,\"userrole\":\"\",\"role\":\"19\",\"inform\":\"49\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-18,\"userrole\":\"\",\"role\":\"2\",\"inform\":\"49\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-19,\"userrole\":\"\",\"role\":\"7\",\"inform\":\"50\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-9,\"userrole\":\"\",\"role\":\"13\",\"inform\":\"53\",\"outform\":\"\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-21,\"userrole\":\"1\",\"role\":null,\"inform\":\"52\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-22,\"userrole\":\"8\",\"role\":null,\"inform\":\"54\",\"outform\":\"36#38#39#41\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"},{\"key\":-23,\"userrole\":\"1\",\"role\":null,\"inform\":\"56\",\"outform\":\"36#38#39#41#55\",\"rkdzkf\":false,\"cjfz\":false,\"prelistener\":\"\",\"afterlistener\":\"\"}]}', '<?xml version=\"1.0\" encoding=\"UTF-8\"?><definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\"><process id=\"Zdc6a04a36a094ebaa186db845f180b53\" isExecutable=\"true\"><startEvent name=\"开始\" id=\"startevent-1.0\"><extensionElements/></startEvent><userTask name=\"补充项目信息\" activiti:assignee=\"ROLE(8)#sd#\" id=\"usertask-2.0\"><documentation><![CDATA[{\"inform\":\"40\",\"outform\":\"41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"普通文件上传资料\" activiti:assignee=\"ROLE(8)#sd#\" id=\"usertask-3.0\"><documentation><![CDATA[{\"inform\":\"24\",\"outform\":\"36#38#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"符合性检查\" activiti:assignee=\"ROLE(10)#sd#\" id=\"usertask-4.0\"><documentation><![CDATA[{\"inform\":\"42\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"符合性复查\" activiti:assignee=\"ROLE(11)\" id=\"usertask-5.0\"><documentation><![CDATA[{\"inform\":\"43\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"符合性复核\" activiti:assignee=\"ROLE(12)\" id=\"usertask-6.0\"><documentation><![CDATA[{\"inform\":\"44\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"提交档案报送预约\" activiti:assignee=\"ROLE(8)#sd#\" id=\"usertask-7.0\"><documentation><![CDATA[{\"inform\":\"51\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"一致性检查\" activiti:assignee=\"ROLE(10)#sd#\" id=\"usertask-8.0\"><documentation><![CDATA[{\"inform\":\"45\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"签发验收合格证\" activiti:assignee=\"ROLE(13)\" id=\"usertask-9.0\"><documentation><![CDATA[{\"inform\":\"53\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"一致性复查\" activiti:assignee=\"ROLE(11)\" id=\"usertask-10.0\"><documentation><![CDATA[{\"inform\":\"46\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"一致性复核\" activiti:assignee=\"ROLE(12)\" id=\"usertask-11.0\"><documentation><![CDATA[{\"inform\":\"47\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"合格证办理(工程声像案)\" activiti:assignee=\"ROLE(18)#sd#\" id=\"usertask-15.0\"><documentation><![CDATA[{\"inform\":\"48\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"合格证办理(工程案)\" activiti:assignee=\"ROLE(1)#sd#\" id=\"usertask-16.0\"><documentation><![CDATA[{\"inform\":\"48\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"合格证审核(工程声像案)\" activiti:assignee=\"ROLE(19)\" id=\"usertask-17.0\"><documentation><![CDATA[{\"inform\":\"49\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"合格证审核(工程案)\" activiti:assignee=\"ROLE(2)\" id=\"usertask-18.0\"><documentation><![CDATA[{\"inform\":\"49\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><endEvent name=\"结束\" id=\"endevent-20.0\"><extensionElements/></endEvent><userTask name=\"合格证审批\" activiti:assignee=\"ROLE(7)\" id=\"usertask-19.0\"><documentation><![CDATA[{\"inform\":\"50\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"经办人预约确认\" activiti:assignee=\"ROLE(1)#sd#\" id=\"usertask-21.0\"><documentation><![CDATA[{\"inform\":\"52\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"立案申请\" activiti:assignee=\"ROLE(8)#sd#\" id=\"usertask-22.0\"><documentation><![CDATA[{\"inform\":\"54\",\"outform\":\"36#38#39#41\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><userTask name=\"经办人确认立案\" activiti:assignee=\"ROLE(1)#sd#\" id=\"usertask-23.0\"><documentation><![CDATA[{\"inform\":\"56\",\"outform\":\"36#38#39#41#55\"}]]></documentation><extensionElements><activiti:taskListener event=\"create\" class=\"com.sd.ubarchive.web.common.linstener.flow.ResetAssigneeListener\"/></extensionElements></userTask><sequenceFlow id=\"flow2\" sourceRef=\"startevent-1.0\" targetRef=\"usertask-2.0\"/><sequenceFlow id=\"flow3\" sourceRef=\"usertask-2.0\" targetRef=\"usertask-3.0\"/><sequenceFlow id=\"flow4\" sourceRef=\"usertask-3.0\" targetRef=\"usertask-4.0\"/><sequenceFlow id=\"flow5\" sourceRef=\"usertask-4.0\" targetRef=\"usertask-5.0\"/><sequenceFlow id=\"flow6\" sourceRef=\"usertask-5.0\" targetRef=\"usertask-6.0\"/><sequenceFlow id=\"flow7\" sourceRef=\"usertask-6.0\" targetRef=\"usertask-7.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow7\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow8\" sourceRef=\"usertask-8.0\" targetRef=\"usertask-10.0\"/><sequenceFlow id=\"flow9\" sourceRef=\"usertask-10.0\" targetRef=\"usertask-11.0\"/><sequenceFlow id=\"flow10\" sourceRef=\"usertask-15.0\" targetRef=\"usertask-16.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow10\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow11\" sourceRef=\"usertask-16.0\" targetRef=\"usertask-17.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow11\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow12\" sourceRef=\"usertask-17.0\" targetRef=\"usertask-18.0\"/><sequenceFlow id=\"flow13\" sourceRef=\"usertask-9.0\" targetRef=\"endevent-20.0\"/><sequenceFlow id=\"flow14\" sourceRef=\"usertask-6.0\" targetRef=\"usertask-2.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow14\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow15\" sourceRef=\"usertask-11.0\" targetRef=\"usertask-2.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow15\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow16\" sourceRef=\"usertask-15.0\" targetRef=\"usertask-11.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow16\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow17\" sourceRef=\"usertask-16.0\" targetRef=\"usertask-11.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow17\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow18\" sourceRef=\"usertask-18.0\" targetRef=\"usertask-19.0\"/><sequenceFlow id=\"flow19\" sourceRef=\"usertask-19.0\" targetRef=\"usertask-9.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow19\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow20\" sourceRef=\"usertask-19.0\" targetRef=\"usertask-11.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow20\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow21\" sourceRef=\"usertask-11.0\" targetRef=\"usertask-22.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow21\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow22\" sourceRef=\"usertask-7.0\" targetRef=\"usertask-21.0\"/><sequenceFlow id=\"flow23\" sourceRef=\"usertask-21.0\" targetRef=\"usertask-8.0\"/><sequenceFlow id=\"flow24\" sourceRef=\"usertask-22.0\" targetRef=\"usertask-23.0\"/><sequenceFlow id=\"flow25\" sourceRef=\"usertask-23.0\" targetRef=\"usertask-15.0\" name=\"通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow25\' || outcomeText==\'通过\'}]]></conditionExpression></sequenceFlow><sequenceFlow id=\"flow26\" sourceRef=\"usertask-23.0\" targetRef=\"usertask-22.0\" name=\"不通过\"><conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'flow26\' || outcomeText==\'不通过\'}]]></conditionExpression></sequenceFlow></process></definitions>', '2016-01-19 17:15:40', '2016-01-29 16:46:36', '已发布', '预约流程（合并版）', '0');

-- ----------------------------
-- Table structure for `flow_form`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form`;
CREATE TABLE `flow_form` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `formname` varchar(40) DEFAULT NULL,
  `tablename` varchar(20) DEFAULT NULL,
  `formdescribe` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastdate` datetime DEFAULT NULL,
  `formElements` text,
  `contenthtml` text,
  `url` varchar(200) DEFAULT NULL,
  `formType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form
-- ----------------------------
INSERT INTO `flow_form` VALUES ('19', '立项申请', null, '建设单位立项申请', '2015-12-28 14:11:28', '2015-12-28 14:11:28', null, null, '/o/project_track/danganlixiang', '0');
INSERT INTO `flow_form` VALUES ('20', '指派工程案经办人', null, null, null, null, null, null, '/flow/assignedGCAJBR', '0');
INSERT INTO `flow_form` VALUES ('21', '指派工程声像案经办人', null, null, null, null, null, null, '/flow/assignedGCSXAJBR', '0');
INSERT INTO `flow_form` VALUES ('22', '指派第三方检查人', null, null, null, null, null, null, '/flow/assignedDSFJC', '0');
INSERT INTO `flow_form` VALUES ('23', '预验收申请', null, '预验收申请', null, null, null, null, '/o/project_track/yuyanshoushenqing', '0');
INSERT INTO `flow_form` VALUES ('24', '资料上传', null, null, null, null, null, null, '/o/project_track/filelist', '0');
INSERT INTO `flow_form` VALUES ('25', '符合必选条件', null, null, null, null, null, null, '/o/fuhetiaojian/find', '0');
INSERT INTO `flow_form` VALUES ('26', '签发认可书', null, null, null, null, null, null, '/i/issue_pre_permission/', '0');
INSERT INTO `flow_form` VALUES ('28', '预验收检查', null, null, null, null, null, null, '/o/prochecktree/YYSJC', '0');
INSERT INTO `flow_form` VALUES ('29', '预验收复查', null, null, null, null, null, null, '/o/prochecktree/YYSFC', '0');
INSERT INTO `flow_form` VALUES ('30', '预验收复核', null, null, null, null, null, null, '/o/prochecktree/YYSFH', '0');
INSERT INTO `flow_form` VALUES ('31', '预验收受理信息', null, null, null, null, null, null, '/i/pre_acceptance/yuyanshoushouli', '1');
INSERT INTO `flow_form` VALUES ('33', '预验收受理并经办', null, null, null, null, null, null, '/i/pre_acceptance/yuyanshoujingban', '0');
INSERT INTO `flow_form` VALUES ('34', '预验收审核', null, null, null, null, null, null, '/i/pre_acceptance/yuyanshoushenhe', '0');
INSERT INTO `flow_form` VALUES ('35', '预验收审批', null, null, null, null, null, null, '/i/pre_acceptance/yuyanshoushenpi', '0');
INSERT INTO `flow_form` VALUES ('36', '项目信息', null, null, null, null, null, null, '/i/project_manage/proInfo', '1');
INSERT INTO `flow_form` VALUES ('37', '立项确认', null, null, null, null, null, null, '/i/pre_acceptance/lixiangqueren', '0');
INSERT INTO `flow_form` VALUES ('38', '流程历史', null, null, null, null, null, null, '/flow/listComment', '1');
INSERT INTO `flow_form` VALUES ('39', '文件列表', null, null, null, null, null, null, '/o/project_track/getFileByXmh', '1');
INSERT INTO `flow_form` VALUES ('40', '补充项目信息', null, null, null, null, null, null, '/o/fuhetiaojian/find', '0');
INSERT INTO `flow_form` VALUES ('41', '检查记录', null, null, null, null, null, null, '/o/prochecktree/findJCJL', '1');
INSERT INTO `flow_form` VALUES ('42', '符合性检查', null, null, null, null, null, null, '/o/prochecktree/FHXJC', '0');
INSERT INTO `flow_form` VALUES ('43', '符合性复查', null, null, null, null, null, null, '/o/prochecktree/FHXFC', '0');
INSERT INTO `flow_form` VALUES ('44', '符合性复核', null, null, null, null, null, null, '/o/prochecktree/FHXFH', '0');
INSERT INTO `flow_form` VALUES ('45', '一致性检查', null, null, null, null, null, null, '/o/prochecktree/YZXJC', '0');
INSERT INTO `flow_form` VALUES ('46', '一致性复查', null, null, null, null, null, null, '/o/prochecktree/YZXFC', '0');
INSERT INTO `flow_form` VALUES ('47', '一致性复核', null, null, null, null, null, null, '/o/prochecktree/YZXFH', '0');
INSERT INTO `flow_form` VALUES ('48', '合格证办理', null, null, null, null, null, null, '/i/pre_acceptance/hegezhengbanli', '0');
INSERT INTO `flow_form` VALUES ('49', '合格证审核', null, null, null, null, null, null, '/i/pre_acceptance/hegezhengshenhe', '0');
INSERT INTO `flow_form` VALUES ('50', '合格证审批', null, null, null, null, null, null, '/i/pre_acceptance/hegezhengshenpi', '0');
INSERT INTO `flow_form` VALUES ('51', '档案报送预约', null, null, null, null, null, null, '/o/project_track/danganyuyue', '0');
INSERT INTO `flow_form` VALUES ('52', '经办人预约确认', null, null, null, null, null, null, '/i/dossier_submit_bespeak/', '0');
INSERT INTO `flow_form` VALUES ('53', '签发验收合格证', null, null, null, null, null, null, '/i/issue_acceptance_certificate/qianfayanshouhegezheng', '0');
INSERT INTO `flow_form` VALUES ('54', '立案申请', null, null, null, null, null, null, '/o/project_track/anyLiAnShenqing', '0');
INSERT INTO `flow_form` VALUES ('55', '立案信息', null, null, null, null, null, null, '/i/sign_file/', '1');
INSERT INTO `flow_form` VALUES ('56', '经办人确认立案', null, null, null, null, null, null, '/i/sign_file/anyLiAnShenqingQueren', '0');
-- ----------------------------
-- Table structure for `flow_form1`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form1`;
CREATE TABLE `flow_form1` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `text1` VARCHAR(255) DEFAULT NULL,
  `text2` VARCHAR(255) DEFAULT NULL,
  `select3` VARCHAR(255) DEFAULT NULL,
  `select4` VARCHAR(255) DEFAULT NULL,
  `radio5` VARCHAR(255) DEFAULT NULL,
  `checkbox6` VARCHAR(255) DEFAULT NULL,
  `textarea7` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form1
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form11`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form11`;
CREATE TABLE `flow_form11` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `select1` VARCHAR(255) DEFAULT NULL,
  `select2` VARCHAR(255) DEFAULT NULL,
  `select3` VARCHAR(255) DEFAULT NULL,
  `select4` VARCHAR(255) DEFAULT NULL,
  `textarea5` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form11
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form12`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form12`;
CREATE TABLE `flow_form12` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `select1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form12
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form13`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form13`;
CREATE TABLE `flow_form13` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `select1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form13
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form14`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form14`;
CREATE TABLE `flow_form14` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `select1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form14
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form15`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form15`;
CREATE TABLE `flow_form15` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `select1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form15
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form16`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form16`;
CREATE TABLE `flow_form16` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `select1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form16
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form17`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form17`;
CREATE TABLE `flow_form17` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `select1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form17
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form18`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form18`;
CREATE TABLE `flow_form18` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `text1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form18
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form19`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form19`;
CREATE TABLE `flow_form19` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `text1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  `text2` VARCHAR(255) DEFAULT NULL,
  `select3` VARCHAR(255) DEFAULT NULL,
  `select4` VARCHAR(255) DEFAULT NULL,
  `radio5` VARCHAR(255) DEFAULT NULL,
  `checkbox6` VARCHAR(255) DEFAULT NULL,
  `textarea7` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form19
-- ----------------------------
INSERT INTO `flow_form19` VALUES ('1', 'h', NULL, '', 'a', '1', NULL, NULL, '');
INSERT INTO `flow_form19` VALUES ('2', 'h', NULL, '', 'a', '1', NULL, NULL, '');

-- ----------------------------
-- Table structure for `flow_form4`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form4`;
CREATE TABLE `flow_form4` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `text1` VARCHAR(255) DEFAULT NULL,
  `text2` VARCHAR(255) DEFAULT NULL,
  `select3` VARCHAR(255) DEFAULT NULL,
  `select4` VARCHAR(255) DEFAULT NULL,
  `radio5` VARCHAR(255) DEFAULT NULL,
  `checkbox6` VARCHAR(255) DEFAULT NULL,
  `textarea7` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form4
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form8`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form8`;
CREATE TABLE `flow_form8` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `text1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_form8
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_form9`
-- ----------------------------
DROP TABLE IF EXISTS `flow_form9`;
CREATE TABLE `flow_form9` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `select1` VARCHAR(255) DEFAULT NULL,
  `textarea2` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of `xt_mb`
-- ----------------------------
insert into `xt_mb` (`mbid`, `mbmc`, `mbnr`, `mbfl`, `cjrid`, `cjrxm`, `cjsj`, `zhxgsj`) values('a101789b4d5343a48163eeca7d7ae23d','广州市城市建设建设工程档案验收合格证','<p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0); font-family: arial, helvetica,sans-serif;\"></span>&nbsp;</p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0); font-family: arial, helvetica,sans-serif;\"></span>&nbsp;</p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0); font-family: arial, helvetica,sans-serif;\">正本&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></p><p style=\"text-align: center;\"><span style=\"font-family: arial, helvetica,sans-serif; font-size: 24px;\">广州市城市建设建设工程档案验收合格证</span></p><p style=\"text-align: center;\"><span style=\"font-family: arial, helvetica,sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编号</span></p><p style=\"text-align: center;\"><span style=\"font-family: arial, helvetica,sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp; 根据国务院第279号令《建设工程质量管理条例》第十六条&nbsp;、第十七条，</span></p><p style=\"text-align: center;\"><span style=\"font-family: arial, helvetica,sans-serif; font-size: 18px;\">建设部第90号令《城市建设档案管理规定》第八条、第九条和《广州市城乡</span></p><p style=\"text-align: center;\"><span style=\"font-family: arial, helvetica,sans-serif; font-size: 18px;\">建设档案管理办法》（穗府（2013）9号）的规定、经核定，本建设工程档案</span></p><p style=\"text-align: center;\"><span style=\"font-family: arial, helvetica,sans-serif; font-size: 18px;\">符合要求，验收合格。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</span></p><p style=\"text-align: center;\"><span style=\"font-family: arial, helvetica,sans-serif;\"><span style=\"font-family: arial, helvetica,sans-serif; font-size: 18px;\"></span><span style=\"text-align: center; font-family: arial, helvetica,sans-serif; font-size: 18px;\">特发此证&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p><p>&nbsp;</p><table align=\"center\"><tbody><tr class=\"firstRow\"><td style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" height=\"72\" valign=\"top\" width=\"193\"><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></p><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp;建 设 单 位</span></p></td><td style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" height=\"72\" valign=\"top\" width=\"394\" align=\"left\"><p>&nbsp;</p><p>&nbsp;<span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">#建设单位名称</span></p></td></tr><tr><td style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" height=\"76\" valign=\"top\" width=\"193\"><p>&nbsp;</p><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 24px;\">&nbsp; <span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">建设项目名称</span></span><br/></p></td><td style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" height=\"76\" valign=\"top\" width=\"394\" align=\"left\"><p>&nbsp;</p><p>&nbsp;<span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 24px;\">#项目名称</span></p></td></tr><tr><td style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" height=\"98\" valign=\"top\" width=\"193\"><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp; &nbsp;</span></p><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp; 建设工程规划</span></p><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp; 验收合格证号 </span></p></td><td style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" height=\"98\" valign=\"top\" width=\"394\" align=\"left\"><p></p><p>&nbsp;</p></td></tr><tr><td style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" height=\"79\" valign=\"top\" width=\"193\"><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp; &nbsp;</span></p><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp;&nbsp;&nbsp;建 设 规 模 &nbsp; &nbsp; </span></p><p style=\"text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp;&nbsp;&nbsp;</span></p></td><td style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" height=\"79\" valign=\"top\" width=\"394\" align=\"left\"><p>&nbsp;</p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">#项目规模</span></p></td></tr></tbody></table><p style=\"text-align: center; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 24px;\">&nbsp; </span></p><p style=\"text-align: right; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; <span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">发证机关：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p><p style=\"text-align: right; text-indent: 0em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp;<br/>&nbsp;日&nbsp;&nbsp;&nbsp;期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><hr/><p style=\"text-align: left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;序号____________&nbsp;</p>','5','2b254c807a4f4c65a08091c17993dfc4','gcajbr','2016-01-27 09:37:58','2016-01-27 15:04:31');
insert into `xt_mb` (`mbid`, `mbmc`, `mbnr`, `mbfl`, `cjrid`, `cjrxm`, `cjsj`, `zhxgsj`) values('c56e631a1d0e45c7b73bed7b7d1ca030','建设工程预验收认可书','<p style=\"text-align: center;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">&nbsp;</span></p><p style=\"text-align: center;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong><span style=\"font-size: 24px; font-family: 宋体, SimKai;\">建设工程预验收认可书</span></strong></span></p><p style=\"text-align: center;\"><br/></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\"><strong style=\"white-space: normal;\"><strong style=\"white-space: normal;\"><strong style=\"white-space: normal;\"><strong style=\"white-space: normal;\"></strong></strong></strong></strong></strong></span></p><table align=\"center\"><tbody><tr class=\"firstRow\"><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"52\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">立 &nbsp;项 &nbsp;号</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"402\" height=\"52\"><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\"><br/></strong></span></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">#项目号</strong></span></p></td></tr><tr><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"50\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">接 收 时 间&nbsp;</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"402\" height=\"50\"><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\"><br/></strong></span></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">#立项时间</strong></span></p></td></tr><tr><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"43\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">认 可 书 号&nbsp;</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"402\" height=\"43\"><br/></td></tr><tr><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"42\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">规划许可证号&nbsp;</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"402\" height=\"42\"><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong><br/></strong></span></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong>#建设工程规划许可证号</strong><br/></span></p></td></tr><tr><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"46\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">建设项目名称&nbsp;</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"402\" height=\"46\"><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\"><br/></strong></span></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">#项目名称</strong></span></p></td></tr><tr><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"43\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">建 设 单 位&nbsp;</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"402\" height=\"43\"><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\"><br/></strong></span></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">#建设单位名称</strong></span></p></td></tr><tr><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"40\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">卷 &nbsp; &nbsp; 数&nbsp;</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0);\" width=\"402\" height=\"40\"><br/></td></tr><tr><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"46\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">经 &nbsp;办 &nbsp;人&nbsp;</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0);\" width=\"402\" height=\"46\"><br/></td></tr><tr><td valign=\"bottom\" style=\"border: 1px solid rgb(0, 0, 0); word-break: break-all;\" width=\"194\" height=\"47\" align=\"center\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"white-space: normal;\">受 &nbsp;理 &nbsp;号&nbsp;</strong></span></td><td valign=\"top\" style=\"border: 1px solid rgb(0, 0, 0);\" width=\"402\" height=\"47\"><br/></td></tr></tbody></table><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"text-align: center;\"><br/></strong></span></p><p style=\"text-align: right;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"text-align: center;\">盖章人签名/日期 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></span></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"text-align: center;\"><br/></strong></span></p><p style=\"text-align: right;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><strong style=\"text-align: center;\">认可书两份领证人/日期 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></span><strong style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></p>','7','2b254c807a4f4c65a08091c17993dfc4','gcajbr','2016-01-27 15:05:17','2016-01-27 17:41:46');
