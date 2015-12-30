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
-- Table structure for lc_xmb
-- ----------------------------
DROP TABLE IF EXISTS lc_xmb;
CREATE TABLE lc_xmb (
  id varchar(32) NOT NULL,
  xmh varchar(255) DEFAULT NULL COMMENT '项目号',
  gch varchar(255) DEFAULT NULL COMMENT '工程号',
  xmmc varchar(255) DEFAULT NULL COMMENT '项目名称',
  xmlx varchar(255) DEFAULT NULL COMMENT '项目类型',
  xmdz varchar(255) DEFAULT NULL COMMENT '项目地址',
  xmgm varchar(255) DEFAULT NULL COMMENT '项目规模',
  tzgs varchar(255) DEFAULT NULL COMMENT '投资概算',
  wfzrzt varchar(255) DEFAULT NULL COMMENT '五方责任主体',
  xgzjh varchar(255) DEFAULT NULL COMMENT '相关证件号',
  ds varchar(255) DEFAULT NULL COMMENT '棟数',
  zzjgdm varchar(255) DEFAULT NULL COMMENT '组织机构代码',
  zdgczt varchar(255) DEFAULT NULL COMMENT '重点工程状态',
  dagfzr varchar(255) DEFAULT NULL COMMENT '档案馆负责人',
  dagjczt varchar(255) DEFAULT NULL COMMENT '档案馆检查状态',
  dsffzr varchar(255) DEFAULT NULL COMMENT '第三方负责人',
  dsfjczt varchar(255) DEFAULT NULL COMMENT '第三方检查状态',
  dalzzt varchar(255) DEFAULT NULL COMMENT '档案流转状态',
  dah varchar(255) DEFAULT NULL COMMENT '档案号',
  lcid varchar(255) DEFAULT NULL COMMENT '流程ID',
  jhzt varchar(255) DEFAULT NULL COMMENT '激活状态',
  lah varchar(255) DEFAULT NULL COMMENT '立案号',  
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '项目表';
-- ----------------------------
-- Table structure for lc_lasq
-- ----------------------------
DROP TABLE IF EXISTS lc_lasq;
CREATE TABLE lc_lasq (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	jsxmmc	 varchar(255) DEFAULT NULL COMMENT 	'建设项目名称',
	jsxmdz	 varchar(255) DEFAULT NULL COMMENT 	'建设项目地址',
	jsdwmc	 varchar(255) DEFAULT NULL COMMENT 	'建设单位名称',
	jsdwdz	 varchar(255) DEFAULT NULL COMMENT 	'建设单位地址',
	jsdwdh	 varchar(255) DEFAULT NULL COMMENT 	'建设单位电话',
	jsdwyzbm	 varchar(255) DEFAULT NULL COMMENT 	'建设单位邮政编码',
	swtrmc	 varchar(255) DEFAULT NULL COMMENT 	'受委托人名称',
	swtrsfzh	 varchar(255) DEFAULT NULL COMMENT 	'受委托人身份证号',
	swtrbgdh	 varchar(255) DEFAULT NULL COMMENT 	'受委托人办公电话',
	swtrsj	 varchar(255) DEFAULT NULL COMMENT 	'受委托人手机',
	jsydghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'建设用地规划许可证号',
	jsgcghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'建设工程规划许可证号',
	ywlb	 varchar(255) DEFAULT NULL COMMENT 	'业务类别',
	jsgcdalb	 varchar(255) DEFAULT NULL COMMENT 	'建设工程档案类别',
	jsgcdayyssqwczt	 varchar(255) DEFAULT NULL COMMENT 	'建设工程档案预验收申请表完成状况',
	jsgcdayyssqbts	 varchar(255) DEFAULT NULL COMMENT 	'建设工程档案预验收申请表套数',
	gcdazyysbgwczt	 varchar(255) DEFAULT NULL COMMENT 	'工程档案专业验收报告完成状况',
	gcdazyysbgts	 varchar(255) DEFAULT NULL COMMENT 	'工程档案专业验收报告套数',
	cjdayjmlwczk	 varchar(255) DEFAULT NULL COMMENT 	'城建档案移交目录完成状况',
	cjdayjmlts	 varchar(255) DEFAULT NULL COMMENT 	'城建档案移交目录套数',
	zzgcdawczk	 varchar(255) DEFAULT NULL COMMENT 	'纸质工程档案完成状况',
	zzgcdats	 varchar(255) DEFAULT NULL COMMENT 	'纸质工程档案套数',
	dzmlwczk	 varchar(255) DEFAULT NULL COMMENT 	'电子目录完成状况',
	dzmlts	 varchar(255) DEFAULT NULL COMMENT 	'电子目录套数',
	sxdawczk	 varchar(255) DEFAULT NULL COMMENT 	'声像档案完成状况',
	sxdats	 varchar(255) DEFAULT NULL COMMENT 	'声像档案套数',
	tzfs	 varchar(255) DEFAULT NULL COMMENT 	'通知方式',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
	sqrqm	 varchar(255) DEFAULT NULL COMMENT 	'申请人签名',
	sqrrq	 varchar(255) DEFAULT NULL COMMENT 	'申请人日期',
	by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
    by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
    by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '立案申请表';

-- ----------------------------
-- Table structure for lc_yyssq
-- ----------------------------
DROP TABLE IF EXISTS lc_yyssq;
CREATE TABLE lc_yyssq (
  id varchar(32) NOT NULL,
    xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	sqbbh	 varchar(255) DEFAULT NULL COMMENT 	'申请表编号',
	ysfs	 varchar(255) DEFAULT NULL COMMENT 	'验收方式',
	bt	 varchar(255) DEFAULT NULL COMMENT 	'标题',
	sqdw	 varchar(255) DEFAULT NULL COMMENT 	'申请单位',
	jsxmmc	 varchar(255) DEFAULT NULL COMMENT 	'建设项目名称',
	jsgcghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'建设工程规划许可证号',
	jswzh varchar(255) DEFAULT NULL COMMENT 	'建设位置',
	jsgm	 varchar(255) DEFAULT NULL COMMENT 	'建设规模',
	zxysqk	 varchar(255) DEFAULT NULL COMMENT 	'专项验收情况',
	gcsgzlys	 varchar(255) DEFAULT NULL COMMENT 	'工程施工质量验收',
	xfys	 varchar(255) DEFAULT NULL COMMENT 	'消防验收',
	rfys	 varchar(255) DEFAULT NULL COMMENT 	'人防验收',
	flys	 varchar(255) DEFAULT NULL COMMENT 	'防雷验收',
	ghys	 varchar(255) DEFAULT NULL COMMENT 	'规划验收',
	hbys	 varchar(255) DEFAULT NULL COMMENT 	'环保验收',
	wsys	 varchar(255) DEFAULT NULL COMMENT 	'卫生验收',
	daystjcl	 varchar(255) DEFAULT NULL COMMENT 	'档案验收提交材料',
	dasl	 varchar(255) DEFAULT NULL COMMENT 	'档案数量',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	dh	 varchar(255) DEFAULT NULL COMMENT 	'电话',
	jsdwyj	 varchar(255) DEFAULT NULL COMMENT 	'建设单位意见',
	jsdwgz	 varchar(255) DEFAULT NULL COMMENT 	'建设单位公章',
	jsdwyjrq	 varchar(255) DEFAULT NULL COMMENT 	'建设单位意见日期',
	jldwyj	 varchar(255) DEFAULT NULL COMMENT 	'监理单位意见',
	jldwgz	 varchar(255) DEFAULT NULL COMMENT 	'监理单位公章',
	jldwyjrq	 varchar(255) DEFAULT NULL COMMENT 	'监理单位意见日期',
	sgdwyj	 varchar(255) DEFAULT NULL COMMENT 	'施工单位意见',
	sgdwgz	 varchar(255) DEFAULT NULL COMMENT 	'施工单位公章',
	sgdwyjrq	 varchar(255) DEFAULT NULL COMMENT 	'施工单位意见日期',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收申请表';

-- ----------------------------
-- Table structure for lc_bslahz
-- ----------------------------
DROP TABLE IF EXISTS lc_bslahz;
CREATE TABLE lc_bslahz (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	jsxmmc	 varchar(255) DEFAULT NULL COMMENT 	'建设项目名称',
	zzml	 varchar(255) DEFAULT NULL COMMENT 	'纸质目录',
	dzml	 varchar(255) DEFAULT NULL COMMENT 	'电子目录',
	ajzs	 varchar(255) DEFAULT NULL COMMENT 	'案卷总数',
	zp	 varchar(255) DEFAULT NULL COMMENT 	'照片（册）',
	jsxmdz	 varchar(255) DEFAULT NULL COMMENT 	'建设项目地址',
	jsdwmc	 varchar(255) DEFAULT NULL COMMENT 	'建设单位名称',
	jsdwdz	 varchar(255) DEFAULT NULL COMMENT 	'建设单位地址',
	jsdwdh	 varchar(255) DEFAULT NULL COMMENT 	'建设单位电话',
	jsdwyzbh	 varchar(255) DEFAULT NULL COMMENT 	'建设单位邮政编码',
	swtr	 varchar(255) DEFAULT NULL COMMENT 	'受委托人',
	swtrsfzh	 varchar(255) DEFAULT NULL COMMENT 	'受委托人身份证号',
	swtrbgdh	 varchar(255) DEFAULT NULL COMMENT 	'受委托人办公电话',
	swtrsj	 varchar(255) DEFAULT NULL COMMENT 	'受委托人手机',
	lxh	 varchar(255) DEFAULT NULL COMMENT 	'立项号',
	slh	 varchar(255) DEFAULT NULL COMMENT 	'受理号',
	lah	 varchar(255) DEFAULT NULL COMMENT 	'立案号',
	larq	 varchar(255) DEFAULT NULL COMMENT 	'立案日期',
	sar	 varchar(255) DEFAULT NULL COMMENT 	'收案人',
	sarq	 varchar(255) DEFAULT NULL COMMENT 	'收案日期',
	lxdh	 varchar(255) DEFAULT NULL COMMENT 	'联系电话',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收立案回执';

-- ----------------------------
-- Table structure for lc_yysslhz
-- ----------------------------
DROP TABLE IF EXISTS lc_yysslhz;
CREATE TABLE lc_yysslhz (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	zzml	 varchar(255) DEFAULT NULL COMMENT 	'纸质目录',
	dzml	 varchar(255) DEFAULT NULL COMMENT 	'电子目录',
	ajzs	 varchar(255) DEFAULT NULL COMMENT 	'案卷总数',
	zp	 varchar(255) DEFAULT NULL COMMENT 	'照片（册）',
	jsxmdz	 varchar(255) DEFAULT NULL COMMENT 	'建设项目地址',
	jsdwmc	 varchar(255) DEFAULT NULL COMMENT 	'建设单位名称',
	jsdwdz	 varchar(255) DEFAULT NULL COMMENT 	'建设单位地址',
	jsdwdh	 varchar(255) DEFAULT NULL COMMENT 	'建设单位电话',
	jsdwyzbh	 varchar(255) DEFAULT NULL COMMENT 	'建设单位邮政编码',
	swtr	 varchar(255) DEFAULT NULL COMMENT 	'受委托人',
	swtrsfzh	 varchar(255) DEFAULT NULL COMMENT 	'受委托人身份证号',
	swtrbgdh	 varchar(255) DEFAULT NULL COMMENT 	'受委托人办公电话',
	swtrsj	 varchar(255) DEFAULT NULL COMMENT 	'受委托人手机',
	lxh	 varchar(255) DEFAULT NULL COMMENT 	'立项号',
	slh	 varchar(255) DEFAULT NULL COMMENT 	'受理号',
	slr	 varchar(255) DEFAULT NULL COMMENT 	'受理人',
	slrq	 varchar(255) DEFAULT NULL COMMENT 	'受理日期',
	slrlxdh	 varchar(255) DEFAULT NULL COMMENT 	'受理人联系电话',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收受理回执存根';

-- ----------------------------
-- Table structure for lc_dab
-- ----------------------------
DROP TABLE IF EXISTS lc_dab;
CREATE TABLE lc_dab (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	dalbh	 varchar(255) DEFAULT NULL COMMENT 	'档案列表号',
	wjh	 varchar(255) DEFAULT NULL COMMENT 	'档案号',
	wjlj	 varchar(255) DEFAULT NULL COMMENT 	'档案路径',
	wjm	 varchar(255) DEFAULT NULL COMMENT 	'档案名',
	jh	 varchar(255) DEFAULT NULL COMMENT 	'卷号',
	wjbh	 varchar(255) DEFAULT NULL COMMENT 	'档案编号',
	ajtm	 varchar(255) DEFAULT NULL COMMENT 	'案卷题名',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	scrq	 varchar(255) DEFAULT NULL COMMENT 	'上传时间',
	anys	 varchar(255) DEFAULT NULL COMMENT 	'案卷页数',
	mj	 varchar(255) DEFAULT NULL COMMENT 	'密级',
	dsfjczt	 varchar(255) DEFAULT NULL COMMENT 	'第三方检查状态',
	dagjczt	 varchar(255) DEFAULT NULL COMMENT 	'档案馆检查状态',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
	yjmlcs	 varchar(255) DEFAULT NULL COMMENT 	'移交目录册数',
	zjs	 varchar(255) DEFAULT NULL COMMENT 	'总卷数',
	wzjs	 varchar(255) DEFAULT NULL COMMENT 	'文字卷数',
	tzjs	 varchar(255) DEFAULT NULL COMMENT 	'图纸卷数',
	gps	 varchar(255) DEFAULT NULL COMMENT 	'光盘数',
	dazt	 varchar(255) DEFAULT NULL COMMENT 	'档案状态',
	rksj	 varchar(255) DEFAULT NULL COMMENT 	'入库时间',
	dh	 varchar(255) DEFAULT NULL COMMENT 	'档号',
	zdjh	 varchar(255) DEFAULT NULL COMMENT 	'总登记号',
	kljch	 varchar(255) DEFAULT NULL COMMENT 	'库列节层号',
	yjr	 varchar(255) DEFAULT NULL COMMENT 	'移交人',
	jsr	 varchar(255) DEFAULT NULL COMMENT 	'接收人',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '档案表';


-- ----------------------------
-- Table structure for lc_yysjcjl
-- ----------------------------
DROP TABLE IF EXISTS lc_yysjcjl;
CREATE TABLE lc_yysjcjl (
  id varchar(32) NOT NULL,
	lxh	 varchar(255) DEFAULT NULL COMMENT 	'立项号',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	sjdw	 varchar(255) DEFAULT NULL COMMENT 	'送检单位',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	dajs	 varchar(255) DEFAULT NULL COMMENT 	'档案卷数',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	dh	 varchar(255) DEFAULT NULL COMMENT 	'电话',
	rq	 varchar(255) DEFAULT NULL COMMENT 	'日期',
	jcyj	 varchar(255) DEFAULT NULL COMMENT 	'检查意见',
	slshyj	 varchar(255) DEFAULT NULL COMMENT 	'受理审核意见',
	slr	 varchar(255) DEFAULT NULL COMMENT 	'受理人',
	shr	 varchar(255) DEFAULT NULL COMMENT 	'审核人',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收检查记录表';

-- ----------------------------
-- Table structure for lc_ysjcjl
-- ----------------------------
DROP TABLE IF EXISTS lc_ysjcjl;
CREATE TABLE lc_ysjcjl (
  id varchar(32) NOT NULL,
	lxh	 varchar(255) DEFAULT NULL COMMENT 	'立项号',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	sjdw	 varchar(255) DEFAULT NULL COMMENT 	'送检单位',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	dajs	 varchar(255) DEFAULT NULL COMMENT 	'档案卷数',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	dh	 varchar(255) DEFAULT NULL COMMENT 	'电话',
	rq	 varchar(255) DEFAULT NULL COMMENT 	'日期',
	jcyj	 varchar(255) DEFAULT NULL COMMENT 	'检查意见',
	lashyj	 varchar(255) DEFAULT NULL COMMENT 	'立案审核意见',
	lar	 varchar(255) DEFAULT NULL COMMENT 	'立案人',
	shr	 varchar(255) DEFAULT NULL COMMENT 	'审核人',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '验收检查记录';

-- ----------------------------
-- Table structure for lc_yysrkssp
-- ----------------------------
DROP TABLE IF EXISTS lc_yysrkssp;
CREATE TABLE lc_yysrkssp (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	slh	 varchar(255) DEFAULT NULL COMMENT 	'受理号',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	gcdz	 varchar(255) DEFAULT NULL COMMENT 	'工程地址',
	jsgcghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'建设工程规划许可证号',
	jsgm	 varchar(255) DEFAULT NULL COMMENT 	'建设规模',
	slcnsj	 varchar(255) DEFAULT NULL COMMENT 	'受理承诺时间',
	sljtblsj	 varchar(255) DEFAULT NULL COMMENT 	'受理具体办理时间',
	jbrbjcnsj	 varchar(255) DEFAULT NULL COMMENT 	'经办人办结承诺时间',
	jbrbjjtblsj	 varchar(255) DEFAULT NULL COMMENT 	'经办人办结具体办理时间',
	shrshsj	 varchar(255) DEFAULT NULL COMMENT 	'审核承诺时间',
	shrcnsj	 varchar(255) DEFAULT NULL COMMENT 	'审核具体办理时间',
	spcnsj	 varchar(255) DEFAULT NULL COMMENT 	'审批承诺时间',
	spjtblsj	 varchar(255) DEFAULT NULL COMMENT 	'审批具体办理时间',
	cjcnblsj	 varchar(255) DEFAULT NULL COMMENT 	'出证承诺时间',
	cjjtblsj	 varchar(255) DEFAULT NULL COMMENT 	'出证具体办理时间',
	jbrsm	 varchar(255) DEFAULT NULL COMMENT 	'经办人说明',
	jbrqz	 varchar(255) DEFAULT NULL COMMENT 	'经办人签字',
	jbrqzrq	 varchar(255) DEFAULT NULL COMMENT 	'经办人签字日期',
	shrsm	 varchar(255) DEFAULT NULL COMMENT 	'审核人说明',
	shrqz	 varchar(255) DEFAULT NULL COMMENT 	'审核人签字',
	shrqzrq	 varchar(255) DEFAULT NULL COMMENT 	'审核人签字日期',
	sprsm	 varchar(255) DEFAULT NULL COMMENT 	'审批人说明',
	sprqz	 varchar(255) DEFAULT NULL COMMENT 	'审批人签字',
	sprqzrq	 varchar(255) DEFAULT NULL COMMENT 	'审批人签字日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收认可书审批';

-- ----------------------------
-- Table structure for lc_yysrks_jz
-- ----------------------------
DROP TABLE IF EXISTS lc_yysrks_jz;
CREATE TABLE lc_yysrks_jz (
  id varchar(32) NOT NULL,
	bh	 varchar(255) DEFAULT NULL COMMENT 	'编号',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	jsxmmc	 varchar(255) DEFAULT NULL COMMENT 	'建设项目名称',
	jsgcghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'建设工程规划许可证号',
	jswz	 varchar(255) DEFAULT NULL COMMENT 	'建设位置',
	jsgm	 varchar(255) DEFAULT NULL COMMENT 	'建设规模',
	yysyj	 varchar(255) DEFAULT NULL COMMENT 	'预验收意见',
	fzjg	 varchar(255) DEFAULT NULL COMMENT 	'发证机关',
	fzrq	 varchar(255) DEFAULT NULL COMMENT 	'发证日期',
	dzgz	 varchar(255) DEFAULT NULL COMMENT 	'电子公章',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收认可书——建筑';


-- ----------------------------
-- Table structure for lc_yysrks_sz_gx
-- ----------------------------
DROP TABLE IF EXISTS lc_yysrks_sz_gx;
CREATE TABLE lc_yysrks_sz_gx (
  id varchar(32) NOT NULL,
	bh	 varchar(255) DEFAULT NULL COMMENT 	'编号',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	jsxmmc	 varchar(255) DEFAULT NULL COMMENT 	'建设项目名称',
	jsgcghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'建设工程规划许可证号',
	jswz	 varchar(255) DEFAULT NULL COMMENT 	'建设位置',
	jsgm	 varchar(255) DEFAULT NULL COMMENT 	'建设规模',
	yysyj	 varchar(255) DEFAULT NULL COMMENT 	'预验收意见',
	fzjg	 varchar(255) DEFAULT NULL COMMENT 	'发证机关',
	fzrq	 varchar(255) DEFAULT NULL COMMENT 	'发证日期',
	dzgz	 varchar(255) DEFAULT NULL COMMENT 	'电子公章',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收认可书——市政——管线';


-- ----------------------------
-- Table structure for lc_yysshyj
-- ----------------------------
DROP TABLE IF EXISTS lc_yysshyj;
CREATE TABLE lc_yysshyj (
  id varchar(32) NOT NULL,
	bh	 varchar(255) DEFAULT NULL COMMENT 	'编号',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	sqrq	 varchar(255) DEFAULT NULL COMMENT 	'申请日期',
	lah	 varchar(255) DEFAULT NULL COMMENT 	'立案号',
	question_1	 varchar(255) DEFAULT NULL COMMENT 	'资料有缺失，应补齐全',
	question_2	 varchar(255) DEFAULT NULL COMMENT 	'部分文件是复印件、签章不齐，应更换成原件、补齐签章',
	question_3	 varchar(255) DEFAULT NULL COMMENT 	'竣工图编制不完整，应编制齐全完整',
	question_4	 varchar(255) DEFAULT NULL COMMENT 	'档案整理、组卷不完整，应按规范完整',
	jg	 varchar(255) DEFAULT NULL COMMENT 	'机关',
	rq	 varchar(255) DEFAULT NULL COMMENT 	'日期',
	dzgz	 varchar(255) DEFAULT NULL COMMENT 	'电子公章',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收审核意见';

-- ----------------------------
-- Table structure for lc_ysshyj
-- ----------------------------
DROP TABLE IF EXISTS lc_ysshyj;
CREATE TABLE lc_ysshyj (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	lah	 varchar(255) DEFAULT NULL COMMENT 	'立案号',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	gcdz	 varchar(255) DEFAULT NULL COMMENT 	'工程地址',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	sgdw	 varchar(255) DEFAULT NULL COMMENT 	'施工单位',
	ajjs	 varchar(255) DEFAULT NULL COMMENT 	'案卷卷数',
	zpcs	 varchar(255) DEFAULT NULL COMMENT 	'照片册数',
    dazgyj	 varchar(255) DEFAULT NULL COMMENT 	'档案整改意见',
	jg	 varchar(255) DEFAULT NULL COMMENT 	'机关',
	rq	 varchar(255) DEFAULT NULL COMMENT 	'日期',
	dzgz	 varchar(255) DEFAULT NULL COMMENT 	'电子公章',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收审核意见';
-- ----------------------------
-- Table structure for lc_gnbgzcpb
-- ----------------------------
DROP TABLE IF EXISTS lc_gnbgzcpb;
CREATE TABLE lc_gnbgzcpb (
  id varchar(32) NOT NULL,
    xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	jjcd	 varchar(255) DEFAULT NULL COMMENT 	'紧急程度',
	cpsx	 varchar(255) DEFAULT NULL COMMENT 	'呈批事项',
	bm	 varchar(255) DEFAULT NULL COMMENT 	'部门',
	jbr	 varchar(255) DEFAULT NULL COMMENT 	'经办人',
	rq	 varchar(255) DEFAULT NULL COMMENT 	'日期',
	bt	 varchar(255) DEFAULT NULL COMMENT 	'标题',
	nrty	 varchar(255) DEFAULT NULL COMMENT 	'内容提要',
	dag	 varchar(255) DEFAULT NULL COMMENT 	'档案馆',
	glc	 varchar(255) DEFAULT NULL COMMENT 	'管理处',
	fwgs	 varchar(255) DEFAULT NULL COMMENT 	'服务公司',
	xzz	 varchar(255) DEFAULT NULL COMMENT 	'行政章',
	ywz	 varchar(255) DEFAULT NULL COMMENT 	'业务章',
	kjwz	 varchar(255) DEFAULT NULL COMMENT 	'科技委章',
	ghz	 varchar(255) DEFAULT NULL COMMENT 	'工会章',
	gcz	 varchar(255) DEFAULT NULL COMMENT 	'馆藏章',
	gy	 varchar(255) DEFAULT NULL COMMENT 	'钢印',
	sl	 varchar(255) DEFAULT NULL COMMENT 	'数量',
	jnw	 varchar(255) DEFAULT NULL COMMENT 	'局内网',
	gww	 varchar(255) DEFAULT NULL COMMENT 	'馆外网',
	wb	 varchar(255) DEFAULT NULL COMMENT 	'微博',
	qt	 varchar(255) DEFAULT NULL COMMENT 	'其他',
	zbbmyj	 varchar(255) DEFAULT NULL COMMENT 	'主办部门意见',
	zbmmfzrqm	 varchar(255) DEFAULT NULL COMMENT 	'主办部门负责人签名',
	zbmmrq	 varchar(255) DEFAULT NULL COMMENT 	'主办部门日期',
	hqbmyj	 varchar(255) DEFAULT NULL COMMENT 	'会签部门意见',
	hqbmjbrqm	 varchar(255) DEFAULT NULL COMMENT 	'会签部门经办人签名',
	hqbmfzrqm	 varchar(255) DEFAULT NULL COMMENT 	'会签部门负责人签名',
	hqbmrq	 varchar(255) DEFAULT NULL COMMENT 	'会签部门日期',
	fggldyj	 varchar(255) DEFAULT NULL COMMENT 	'分管馆领导意见',
	fggldqm	 varchar(255) DEFAULT NULL COMMENT 	'分管馆领导签名',
	fgrq	 varchar(255) DEFAULT NULL COMMENT 	'分管日期',
	gzps	 varchar(255) DEFAULT NULL COMMENT 	'馆长批示',
	gzqm	 varchar(255) DEFAULT NULL COMMENT 	'馆长签名',
	gzrq	 varchar(255) DEFAULT NULL COMMENT 	'馆长日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '馆内部工作呈批表';


-- ----------------------------
-- Table structure for lc_tgyysrkdh
-- ----------------------------
DROP TABLE IF EXISTS lc_tgyysrkdh;
CREATE TABLE lc_tgyysrkdh (
  id varchar(32) NOT NULL,
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	yyslarq	 varchar(255) DEFAULT NULL COMMENT 	'预验收立案日期',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	xsxzdnr	 varchar(255) DEFAULT NULL COMMENT 	'显示选择的内容',
	jg	 varchar(255) DEFAULT NULL COMMENT 	'机关',
	sprq	 varchar(255) DEFAULT NULL COMMENT 	'审批日期',
	dzgz	 varchar(255) DEFAULT NULL COMMENT 	'电子公章',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '通过预验收认可的函';

-- ----------------------------
-- Table structure for lc_bsyysq
-- ----------------------------
DROP TABLE IF EXISTS lc_bsyysq;
CREATE TABLE lc_bsyysq (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	gcbh	 varchar(255) DEFAULT NULL COMMENT 	'工程编号',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	gcdz	 varchar(255) DEFAULT NULL COMMENT 	'工程地址',
	yysj	 varchar(255) DEFAULT NULL COMMENT 	'预约时间',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '报送预约申请';


-- ----------------------------
-- Table structure for lc_kfqd
-- ----------------------------
DROP TABLE IF EXISTS lc_kfqd;
CREATE TABLE lc_kfqd (
  id varchar(32) NOT NULL,
    qdid	 varchar(255) DEFAULT NULL COMMENT 	'清单ID',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	gch	 varchar(255) DEFAULT NULL COMMENT 	'工程号',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	gclx	 varchar(255) DEFAULT NULL COMMENT 	'工程类型',
	dah	 varchar(255) DEFAULT NULL COMMENT 	'档案号',
	damc	 varchar(255) DEFAULT NULL COMMENT 	'档案名称',
	dalzzt	 varchar(255) DEFAULT NULL COMMENT 	'档案流转状态',
	daxz	 varchar(255) DEFAULT NULL COMMENT 	'档案性质',
	yjr	 varchar(255) DEFAULT NULL COMMENT 	'移交人',
	jsr	 varchar(255) DEFAULT NULL COMMENT 	'接收人',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '库房清单';

-- ----------------------------
-- Table structure for lc_yssq
-- ----------------------------
DROP TABLE IF EXISTS lc_yssq;
CREATE TABLE lc_yssq (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	sqbbh	 varchar(255) DEFAULT NULL COMMENT 	'请表编号',
	ysfs	 varchar(255) DEFAULT NULL COMMENT 	'验收方式',
	bt	 varchar(255) DEFAULT NULL COMMENT 	'标题',
	sqdw	 varchar(255) DEFAULT NULL COMMENT 	'申请单位',
	jsxmmc	 varchar(255) DEFAULT NULL COMMENT 	'建设项目名称',
	jsgcghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'建设工程规划许可证号',
	jswz	 varchar(255) DEFAULT NULL COMMENT 	'建设位置',
	jsgm	 varchar(255) DEFAULT NULL COMMENT 	'建设规模',
	zxysqk	 varchar(255) DEFAULT NULL COMMENT 	'专项验收情况',
	gcsgzlys	 varchar(255) DEFAULT NULL COMMENT 	'工程施工质量验收',
	xfys	 varchar(255) DEFAULT NULL COMMENT 	'消防验收',
	rfys	 varchar(255) DEFAULT NULL COMMENT 	'人防验收',
	flys	 varchar(255) DEFAULT NULL COMMENT 	'防雷验收',
	ghys	 varchar(255) DEFAULT NULL COMMENT 	'规划验收',
	hbys	 varchar(255) DEFAULT NULL COMMENT 	'环保验收',
	wsys	 varchar(255) DEFAULT NULL COMMENT 	'卫生验收',
	daystjcl	 varchar(255) DEFAULT NULL COMMENT 	'档案验收提交材料',
	dasl	 varchar(255) DEFAULT NULL COMMENT 	'档案数量',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	dh	 varchar(255) DEFAULT NULL COMMENT 	'电话',
	jsdwyj	 varchar(255) DEFAULT NULL COMMENT 	'建设单位意见',
	jsdwgz	 varchar(255) DEFAULT NULL COMMENT 	'建设单位公章',
	jsdwyjrq	 varchar(255) DEFAULT NULL COMMENT 	'建设单位意见日期',
	jldwyj	 varchar(255) DEFAULT NULL COMMENT 	'监理单位意见',
	jldwgz	 varchar(255) DEFAULT NULL COMMENT 	'监理单位公章',
	jldwyjrq	 varchar(255) DEFAULT NULL COMMENT 	'监理单位意见日期',
	sgdwyj	 varchar(255) DEFAULT NULL COMMENT 	'施工单位意见',
	sgdwgz	 varchar(255) DEFAULT NULL COMMENT 	'施工单位公章',
	sgdwyjrq	 varchar(255) DEFAULT NULL COMMENT 	'施工单位意见日期',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '验收申请';
-- ----------------------------
-- Table structure for lc_yshgzsp
-- ----------------------------
DROP TABLE IF EXISTS lc_yshgzsp;
CREATE TABLE lc_yshgzsp (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	lxh	 varchar(255) DEFAULT NULL COMMENT 	'立项号',
	slh	 varchar(255) DEFAULT NULL COMMENT 	'受理号',
	lah	 varchar(255) DEFAULT NULL COMMENT 	'立案号',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	gcdz	 varchar(255) DEFAULT NULL COMMENT 	'工程地址',
	ghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'规划许可证号',
	jsgm	 varchar(255) DEFAULT NULL COMMENT 	'建设规模',
	ysdd	 varchar(255) DEFAULT NULL COMMENT 	'验收地点',
	yssj	 varchar(255) DEFAULT NULL COMMENT 	'验收时间',
	yscjr	 varchar(255) DEFAULT NULL COMMENT 	'验收参加人',
	lacnsj	 varchar(255) DEFAULT NULL COMMENT 	'立案承诺时间',
	lablsj	 varchar(255) DEFAULT NULL COMMENT 	'立案办理时间',
	jbrbjcnsj	 varchar(255) DEFAULT NULL COMMENT 	'经办人办结承诺时间',
	jbrbjbjsj	 varchar(255) DEFAULT NULL COMMENT 	'经办人办结办理时间',
	shcnsj	 varchar(255) DEFAULT NULL COMMENT 	'审核承诺时间',
	shblsj	 varchar(255) DEFAULT NULL COMMENT 	'审核办理时间',
	spcnsj	 varchar(255) DEFAULT NULL COMMENT 	'审批承诺时间',
	spblsj	 varchar(255) DEFAULT NULL COMMENT 	'审批办理时间',
	qfyjscnsj	 varchar(255) DEFAULT NULL COMMENT 	'签发移交书承诺时间',
	qfyjsblsj	 varchar(255) DEFAULT NULL COMMENT 	'签发移交书办理时间',
	ddkblyj	 varchar(255) DEFAULT NULL COMMENT 	'督导科办理意见',
	ddkjbr	 varchar(255) DEFAULT NULL COMMENT 	'督导科经办人',
	ddkjbrqzrq	 varchar(255) DEFAULT NULL COMMENT 	'督导科经办人签字日期',
	ddkshr	 varchar(255) DEFAULT NULL COMMENT 	'督导科审核人',
	ddkshrqzrq	 varchar(255) DEFAULT NULL COMMENT 	'督导科审核人签字日期',
	jykblyj	 varchar(255) DEFAULT NULL COMMENT 	'借阅科办理意见',
	jykjbr	 varchar(255) DEFAULT NULL COMMENT 	'借阅科经办人',
	jykjbrqzrq	 varchar(255) DEFAULT NULL COMMENT 	'借阅科经办人签字日期',
	jykfzr	 varchar(255) DEFAULT NULL COMMENT 	'借阅科负责人',
	jykfzrqzrq	 varchar(255) DEFAULT NULL COMMENT 	'借阅科负责人签字日期',
	gldsp	 varchar(255) DEFAULT NULL COMMENT 	'馆领导审批意见',
	gld	 varchar(255) DEFAULT NULL COMMENT 	'馆领导',
	gldqzrq	 varchar(255) DEFAULT NULL COMMENT 	'馆领导签字日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '验收合格证审批';


-- ----------------------------
-- Table structure for lc_spb_tyb
-- ----------------------------
DROP TABLE IF EXISTS lc_spb_tyb;
CREATE TABLE lc_spb_tyb (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	lah	 varchar(255) DEFAULT NULL COMMENT 	'立案号',
	slh	 varchar(255) DEFAULT NULL COMMENT 	'受理号',
	lxh	 varchar(255) DEFAULT NULL COMMENT 	'立项号',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	gcdz	 varchar(255) DEFAULT NULL COMMENT 	'工程地址',
	ghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'规划许可证号',
	jsgm	 varchar(255) DEFAULT NULL COMMENT 	'建设规模',
	ysdd	 varchar(255) DEFAULT NULL COMMENT 	'验收地点',
	yssj	 varchar(255) DEFAULT NULL COMMENT 	'验收时间',
	yscjr	 varchar(255) DEFAULT NULL COMMENT 	'验收参加人',
	lacnsj	 varchar(255) DEFAULT NULL COMMENT 	'立案承诺时间',
	lajtblsj	 varchar(255) DEFAULT NULL COMMENT 	'立案具体办理时间',
	jbrbjcnsj	 varchar(255) DEFAULT NULL COMMENT 	'经办人办结承诺时间',
	jbrbjjtblsj	 varchar(255) DEFAULT NULL COMMENT 	'经办人办结具体办理时间',
	shcnsj	 varchar(255) DEFAULT NULL COMMENT 	'审核承诺时间',
	shjtblsj	 varchar(255) DEFAULT NULL COMMENT 	'审核具体办理时间',
	spcnsj	 varchar(255) DEFAULT NULL COMMENT 	'审批承诺时间',
	spjtblsj	 varchar(255) DEFAULT NULL COMMENT 	'审批具体办理时间',
	fyjscnsj	 varchar(255) DEFAULT NULL COMMENT 	'发移交书承诺时间',
	fyjsjtblsj	 varchar(255) DEFAULT NULL COMMENT 	'发移交书具体办理时间',
	ddkblyj	 varchar(255) DEFAULT NULL COMMENT 	'督导科办理意见',
	ddkqm	 varchar(255) DEFAULT NULL COMMENT 	'督导科签名',
	ddkblrq	 varchar(255) DEFAULT NULL COMMENT 	'督导科办理日期',
	jykblyj	 varchar(255) DEFAULT NULL COMMENT 	'借阅科办理意见',
	jykqm	 varchar(255) DEFAULT NULL COMMENT 	'借阅科签名',
	jykblrq	 varchar(255) DEFAULT NULL COMMENT 	'借阅科办理日期',
	gldspyj	 varchar(255) DEFAULT NULL COMMENT 	'馆领导审批意见',
	gldqm	 varchar(255) DEFAULT NULL COMMENT 	'馆领导签名',
	gldsprq	 varchar(255) DEFAULT NULL COMMENT 	'馆领导审批日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '审批表——通用表';

-- ----------------------------
-- Table structure for lc_ysscyjd
-- ----------------------------
DROP TABLE IF EXISTS lc_ysscyjd;
CREATE TABLE lc_ysscyjd (
  id varchar(32) NOT NULL,
	lah	 varchar(255) DEFAULT NULL COMMENT 	'立案号',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	gcdz	 varchar(255) DEFAULT NULL COMMENT 	'工程地址',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	sgdw	 varchar(255) DEFAULT NULL COMMENT 	'施工单位',
	ajjs	 varchar(255) DEFAULT NULL COMMENT 	'案卷卷数',
	zpcs	 varchar(255) DEFAULT NULL COMMENT 	'照片册数',
	dnzgyj	 varchar(255) DEFAULT NULL COMMENT 	'档案整改意见',
	rq	 varchar(255) DEFAULT NULL COMMENT 	'日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '验收审查意见单';

-- ----------------------------
-- Table structure for lc_fhxjcyj
-- ----------------------------
DROP TABLE IF EXISTS lc_fhxjcyj;
CREATE TABLE lc_fhxjcyj (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	lxh	 varchar(255) DEFAULT NULL COMMENT 	'立项号',
	slh	 varchar(255) DEFAULT NULL COMMENT 	'受理号',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	dajs	 varchar(255) DEFAULT NULL COMMENT 	'档案卷数',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	dh	 varchar(255) DEFAULT NULL COMMENT 	'电话',
	jcrq	 varchar(255) DEFAULT NULL COMMENT 	'检查日期',
	jcyj	 varchar(255) DEFAULT NULL COMMENT 	'检查意见',
	jcr	 varchar(255) DEFAULT NULL COMMENT 	'检查人',
	fjr	 varchar(255) DEFAULT NULL COMMENT 	'复检人',
	hcrq	 varchar(255) DEFAULT NULL COMMENT 	'核查日期',
	hcyj	 varchar(255) DEFAULT NULL COMMENT 	'核查意见',
	fhr	 varchar(255) DEFAULT NULL COMMENT 	'复核人',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '符合性检查意见';

-- ----------------------------
-- Table structure for lc_yysfhxjcyj
-- ----------------------------
DROP TABLE IF EXISTS lc_yysfhxjcyj;
CREATE TABLE lc_yysfhxjcyj (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	lxh	 varchar(255) DEFAULT NULL COMMENT 	'立项号',
	sjdw	 varchar(255) DEFAULT NULL COMMENT 	'送检单位',
	gcmc	 varchar(255) DEFAULT NULL COMMENT 	'工程名称',
	dajs	 varchar(255) DEFAULT NULL COMMENT 	'档案卷数',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	dh	 varchar(255) DEFAULT NULL COMMENT 	'电话',
	jcrq	 varchar(255) DEFAULT NULL COMMENT 	'检查日期',
	jcyj	 varchar(255) DEFAULT NULL COMMENT 	'检查意见',
	jcr	 varchar(255) DEFAULT NULL COMMENT 	'检查人',
	fjr	 varchar(255) DEFAULT NULL COMMENT 	'复检人',
	hcrq	 varchar(255) DEFAULT NULL COMMENT 	'核查日期',
	hcyj	 varchar(255) DEFAULT NULL COMMENT 	'核查意见',
	fhr	 varchar(255) DEFAULT NULL COMMENT 	'复核人',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收符合性检查意见';


-- ----------------------------
-- Table structure for lc_ysrksdjb
-- ----------------------------
DROP TABLE IF EXISTS lc_ysrksdjb;
CREATE TABLE lc_ysrksdjb (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	lah	 varchar(255) DEFAULT NULL COMMENT 	'立案号',
	lxh	varchar(255) DEFAULT NULL COMMENT	'立项号',
	slh	varchar(255) DEFAULT NULL COMMENT	'受理号',
	jsrq	 varchar(255) DEFAULT NULL COMMENT 	'接收日期',
	rksh	 varchar(255) DEFAULT NULL COMMENT 	'认可书号',
	ghxkzh	 varchar(255) DEFAULT NULL COMMENT 	'规划许可证号',
	jsxmmc	 varchar(255) DEFAULT NULL COMMENT 	'建设项目名称',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	jswz	 varchar(255) DEFAULT NULL COMMENT 	'建设位置',
	js	 varchar(255) DEFAULT NULL COMMENT 	'卷数',
	czwt	 varchar(255) DEFAULT NULL COMMENT 	'存在问题',
	jbr	 varchar(255) DEFAULT NULL COMMENT 	'经办人',
	gzrqm	 varchar(255) DEFAULT NULL COMMENT 	'盖章人签名',
	gzrrq	 varchar(255) DEFAULT NULL COMMENT 	'盖章人日期',
	lzr	 varchar(255) DEFAULT NULL COMMENT 	'领证人',
	lzrrq	 varchar(255) DEFAULT NULL COMMENT 	'领证人日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '验收认可书登记表';


-- ----------------------------
-- Table structure for lc_ysdjb_hgz
-- ----------------------------
DROP TABLE IF EXISTS lc_ysdjb_hgz;
CREATE TABLE lc_ysdjb_hgz (
  id varchar(32) NOT NULL,
	xh	varchar(255) DEFAULT NULL COMMENT	'序号',
	xmh	varchar(255) DEFAULT NULL COMMENT	'项目号',
	larq	varchar(255) DEFAULT NULL COMMENT	'立案日期',
	lxh	varchar(255) DEFAULT NULL COMMENT	'立项号',
	slh	varchar(255) DEFAULT NULL COMMENT	'受理号',
	lah	varchar(255) DEFAULT NULL COMMENT	'立案号',
	ghyshgzh	varchar(255) DEFAULT NULL COMMENT	'规划验收合格证号',
	dayshgzh	varchar(255) DEFAULT NULL COMMENT	'档案验收合格证号',
	gcmc	varchar(255) DEFAULT NULL COMMENT	'工程名称',
	jsdw	varchar(255) DEFAULT NULL COMMENT	'建设单位',
	gcdz	varchar(255) DEFAULT NULL COMMENT	'工程地址（区）',
	sprq	varchar(255) DEFAULT NULL COMMENT	'审批日期',
	gzrqm	varchar(255) DEFAULT NULL COMMENT	'盖章人签名',
	gzrq	varchar(255) DEFAULT NULL COMMENT	'盖章日期',
	lzrqm	varchar(255) DEFAULT NULL COMMENT	'领件人签名',
	lzrq	varchar(255) DEFAULT NULL COMMENT	'领证日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '验收登记表——合格证';

-- ----------------------------
-- Table structure for lc_ysdjb_yjs
-- ----------------------------
DROP TABLE IF EXISTS lc_ysdjb_yjs;
CREATE TABLE lc_ysdjb_yjs (
  id varchar(32) NOT NULL,
	xh	varchar(255) DEFAULT NULL COMMENT	'序号',
	xmh	varchar(255) DEFAULT NULL COMMENT	'项目号',
	larq	varchar(255) DEFAULT NULL COMMENT	'立案日期',
	lxh	varchar(255) DEFAULT NULL COMMENT	'立项号',
	slh	varchar(255) DEFAULT NULL COMMENT	'受理号',
	lah	varchar(255) DEFAULT NULL COMMENT	'立案号',
	ghyshgzh	varchar(255) DEFAULT NULL COMMENT	'规划验收合格证号',
	dayshgzh	varchar(255) DEFAULT NULL COMMENT	'档案验收合格证号',
	gcmc	varchar(255) DEFAULT NULL COMMENT	'工程名称',
	jsdw	varchar(255) DEFAULT NULL COMMENT	'建设单位',
	gcdz	varchar(255) DEFAULT NULL COMMENT	'工程地址（区）',
	sprq	varchar(255) DEFAULT NULL COMMENT	'审批日期',
	gzrqm	varchar(255) DEFAULT NULL COMMENT	'盖章人签名',
	gzrq	varchar(255) DEFAULT NULL COMMENT	'盖章日期',
	lzrqm	varchar(255) DEFAULT NULL COMMENT	'领件人签名',
	lzrq	varchar(255) DEFAULT NULL COMMENT	'领证日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '验收登记表——移交书';

-- ----------------------------
-- Table structure for lc_jcyydjb
-- ----------------------------
DROP TABLE IF EXISTS lc_jcyydjb;
CREATE TABLE lc_jcyydjb (
  id varchar(32) NOT NULL,
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	yyrq	 varchar(255) DEFAULT NULL COMMENT 	'预约日期（月/日/星期）',
	jtrq	 varchar(255) DEFAULT NULL COMMENT 	'接听日期（月/日）',
	lx	 varchar(255) DEFAULT NULL COMMENT 	'类型',
	xmmc	 varchar(255) DEFAULT NULL COMMENT 	'项目名称',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	js	 varchar(255) DEFAULT NULL COMMENT 	'卷数（卷）',
	zxysyj	 varchar(255) DEFAULT NULL COMMENT 	'专项验收情况',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	lxdh	 varchar(255) DEFAULT NULL COMMENT 	'联系电话',
	cfj	 varchar(255) DEFAULT NULL COMMENT 	'初/复检',
	jcr	 varchar(255) DEFAULT NULL COMMENT 	'检查人',
	fcr	 varchar(255) DEFAULT NULL COMMENT 	'复查人',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '检查预约登记表';

-- ----------------------------
-- Table structure for lc_zxdjb
-- ----------------------------
DROP TABLE IF EXISTS lc_zxdjb;
CREATE TABLE lc_zxdjb (
  id varchar(32) NOT NULL,
	zxrq	 varchar(255) DEFAULT NULL COMMENT 	'咨询日期（月/日）',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	lx	 varchar(255) DEFAULT NULL COMMENT 	'类型',
	xmmc	 varchar(255) DEFAULT NULL COMMENT 	'项目名称',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	js	 varchar(255) DEFAULT NULL COMMENT 	'卷数（卷）',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	lxdh	 varchar(255) DEFAULT NULL COMMENT 	'联系电话',
	qqqk	 varchar(255) DEFAULT NULL COMMENT 	'齐全情况',
	fyjqk	 varchar(255) DEFAULT NULL COMMENT 	'复印件情况',
	bzqk	 varchar(255) DEFAULT NULL COMMENT 	'编制情况',
	jbr	 varchar(255) DEFAULT NULL COMMENT 	'经办人',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '咨询登记表';
-- ----------------------------
-- Table structure for lc_fhxjcdjb
-- ----------------------------
DROP TABLE IF EXISTS lc_fhxjcdjb;
CREATE TABLE lc_fhxjcdjb (
  id varchar(32) NOT NULL,
    xh varchar(32) NULL COMMENT '序号',
	lx	 varchar(255) DEFAULT NULL COMMENT 	'类型',
	xmh	 varchar(255) DEFAULT NULL COMMENT 	'项目号',
	xmmc	 varchar(255) DEFAULT NULL COMMENT 	'项目名称',
	jsdw	 varchar(255) DEFAULT NULL COMMENT 	'建设单位',
	gcdz	 varchar(255) DEFAULT NULL COMMENT 	'工程地址',
	js	 varchar(255) DEFAULT NULL COMMENT 	'卷数（卷）',
	lxr	 varchar(255) DEFAULT NULL COMMENT 	'联系人',
	lxdh	 varchar(255) DEFAULT NULL COMMENT 	'联系电话',
	jczz	 varchar(255) DEFAULT NULL COMMENT 	'检查组长',
	jczy	 varchar(255) DEFAULT NULL COMMENT 	'检查组员',
	jcsj	 varchar(255) DEFAULT NULL COMMENT 	'检查时间',
	fczz	 varchar(255) DEFAULT NULL COMMENT 	'复查组长',
	fczy	 varchar(255) DEFAULT NULL COMMENT 	'复查组员',
	fcsj	 varchar(255) DEFAULT NULL COMMENT 	'复查时间',
	fhr	 varchar(255) DEFAULT NULL COMMENT 	'复核人',
	fhsj	 varchar(255) DEFAULT NULL COMMENT 	'复核时间',
	bz	 varchar(255) DEFAULT NULL COMMENT 	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '符合性检查登记表';

-- ----------------------------
-- Table structure for yh_yhb
-- ----------------------------
DROP TABLE IF EXISTS yh_yhb;
CREATE TABLE yh_yhb (
  id varchar(32) NOT NULL,
  yhid	varchar(255) DEFAULT NULL COMMENT	'用户ID',
  yhm	varchar(255) DEFAULT NULL COMMENT	'用户名',
  mm	varchar(255) DEFAULT NULL COMMENT	'密码',
  zhlx	varchar(255) DEFAULT NULL COMMENT	'帐号类型',
  scdlsj	varchar(255) DEFAULT NULL COMMENT	'上次登录时间',
  ipdz	varchar(255) DEFAULT NULL COMMENT	'IP地址',
  xmxxqrzt	varchar(255) DEFAULT NULL COMMENT	'项目学习确认状态',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户表';

-- ----------------------------
-- Table structure for yh_yhxxb
-- ----------------------------
DROP TABLE IF EXISTS yh_yhxxb;
CREATE TABLE yh_yhxxb (
  id varchar(32) NOT NULL,
  ssgsid	varchar(255) DEFAULT NULL COMMENT	'所属公司ID',
  ssgsmc	varchar(255) DEFAULT NULL COMMENT	'所属公司名称',
  ssgsdz	varchar(255) DEFAULT NULL COMMENT	'所属公司地址',
  yx	varchar(255) DEFAULT NULL COMMENT	'邮箱',
  lxdh	varchar(255) DEFAULT NULL COMMENT	'联系电话',
  yyzz	varchar(255) DEFAULT NULL COMMENT	'营业执照',
  syt	varchar(255) DEFAULT NULL COMMENT	'水印图',
  sfzfyj	varchar(255) DEFAULT NULL COMMENT	'身份证复印件',
  sfzh	varchar(255) DEFAULT NULL COMMENT	'身份证号',
  yhid	varchar(255) DEFAULT NULL COMMENT	'用户ID',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户信息表';

-- ----------------------------
-- Table structure for yh_yhxmb
-- ----------------------------
DROP TABLE IF EXISTS yh_yhxmb;
CREATE TABLE yh_yhxmb (
  id varchar(32) NOT NULL,
  yhid	varchar(255) DEFAULT NULL COMMENT	'用户ID',
  xmh	varchar(255) DEFAULT NULL COMMENT	'项目号',
  lcid  varchar(10) DEFAULT NULL COMMENT '流程id',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户项目表';
-- ----------------------------
-- Table structure for yh_lhjlb
-- ----------------------------
DROP TABLE IF EXISTS yh_lhjlb;
CREATE TABLE yh_lhjlb (
  id varchar(32) NOT NULL,
  jlid	varchar(255) DEFAULT NULL COMMENT	'记录ID',
  xmh	varchar(255) DEFAULT NULL COMMENT	'项目号',
  czr	varchar(255) DEFAULT NULL COMMENT	'操作人',
  czrq	varchar(255) DEFAULT NULL COMMENT	'操作日期',
  czsj	varchar(255) DEFAULT NULL COMMENT	'操作事件',
  cznr	varchar(255) DEFAULT NULL COMMENT	'操作内容',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '留痕记录表';
-- ----------------------------
-- Table structure for yh_jsb
-- ----------------------------
DROP TABLE IF EXISTS yh_jsb;
CREATE TABLE yh_jsb (
  id varchar(32) NOT NULL,
  jsid	varchar(255) DEFAULT NULL COMMENT	'角色ID',
  jsmc	varchar(255) DEFAULT NULL COMMENT	'角色名称',
  ssjsz	varchar(255) DEFAULT NULL COMMENT	'所属角色组',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色表';
-- ----------------------------
-- Table structure for yh_yhjsb
-- ----------------------------
DROP TABLE IF EXISTS yh_yhjsb;
CREATE TABLE yh_yhjsb (
  id varchar(32) NOT NULL,
  jsid	varchar(255) DEFAULT NULL COMMENT	'角色ID',
  yhid	varchar(255) DEFAULT NULL COMMENT	'用户ID',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户角色表';

-- ----------------------------
-- Table structure for yh_qxb
-- ----------------------------
DROP TABLE IF EXISTS yh_qxb;
CREATE TABLE yh_qxb (
  id varchar(32) NOT NULL,
  qxid	varchar(255) DEFAULT NULL COMMENT	'权限ID',
  qxmc	varchar(255) DEFAULT NULL COMMENT	'权限名称',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '权限表';
-- ----------------------------
-- Table structure for yh_jsqxb
-- ----------------------------
DROP TABLE IF EXISTS yh_jsqxb;
CREATE TABLE yh_jsqxb (
  id varchar(32) NOT NULL,
  jsid	varchar(255) DEFAULT NULL COMMENT	'角色ID',
  qxid	varchar(255) DEFAULT NULL COMMENT	'权限ID',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色权限表'; 
-- ----------------------------
-- Table structure for yh_zyb
-- ----------------------------
DROP TABLE IF EXISTS yh_zyb;
CREATE TABLE yh_zyb (
  id varchar(32) NOT NULL,
  zyid	varchar(255) DEFAULT NULL COMMENT	'资源ID',
  zy1	varchar(255) DEFAULT NULL COMMENT	'资源1',
  zy2	varchar(255) DEFAULT NULL COMMENT	'资源2',
  zy3	varchar(255) DEFAULT NULL COMMENT	'资源3',
  zy4	varchar(255) DEFAULT NULL COMMENT	'资源4',
  zy5	varchar(255) DEFAULT NULL COMMENT	'资源5',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '资源表';

-- ----------------------------
-- Table structure for yh_jsqxzyb
-- ----------------------------
DROP TABLE IF EXISTS yh_jsqxzyb;
CREATE TABLE yh_jsqxzyb (
  id varchar(32) NOT NULL,
  jsid	varchar(255) DEFAULT NULL COMMENT	'角色ID',
  qxid	varchar(255) DEFAULT NULL COMMENT	'权限ID',
  zyid	varchar(255) DEFAULT NULL COMMENT	'资源ID',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色权限资源表';

-- ----------------------------
-- Table structure for yh_jsqxzyb
-- ----------------------------
DROP TABLE IF EXISTS yh_jsqxzyb;
CREATE TABLE yh_jsqxzyb (
  id varchar(32) NOT NULL,
  jsid	varchar(255) DEFAULT NULL COMMENT	'角色ID',
  qxid	varchar(255) DEFAULT NULL COMMENT	'权限ID',
  zyid	varchar(255) DEFAULT NULL COMMENT	'资源ID',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色权限资源表';

-- ----------------------------
-- Table structure for zx_tjclb
-- ----------------------------
DROP TABLE IF EXISTS zx_tjclb;
CREATE TABLE zx_tjclb (
  id varchar(32) NOT NULL,
  xh	varchar(255) DEFAULT NULL COMMENT	'序号',
  lx	varchar(255) DEFAULT NULL COMMENT	'类型',
  clmc	varchar(255) DEFAULT NULL COMMENT	'材料名称',
  fs	varchar(255) DEFAULT NULL COMMENT	'份数',
  clxs	varchar(255) DEFAULT NULL COMMENT	'材料形式',
  bz	varchar(255) DEFAULT NULL COMMENT	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '预验收和报送应提交材料表';

-- ----------------------------
-- Table structure for zx_sqbldd
-- ----------------------------
DROP TABLE IF EXISTS zx_sqbldd;
CREATE TABLE zx_sqbldd (
  id varchar(32) NOT NULL,
  blsx	varchar(255) DEFAULT NULL COMMENT	'办理事项',
  bljg	varchar(255) DEFAULT NULL COMMENT	'办理机构',
  dz	varchar(255) DEFAULT NULL COMMENT	'地址',
  fwsj	varchar(255) DEFAULT NULL COMMENT	'服务时间',
  dh	varchar(255) DEFAULT NULL COMMENT	'电话',
  wz	varchar(255) DEFAULT NULL COMMENT	'网址',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '申请办理地址';

-- ----------------------------
-- Table structure for zx_gcwjbsyq
-- ----------------------------
DROP TABLE IF EXISTS zx_gcwjbsyq;
CREATE TABLE zx_gcwjbsyq (
  id varchar(32) NOT NULL,
  xh	varchar(255) DEFAULT NULL COMMENT	'序号',
  wjbh	varchar(255) DEFAULT NULL COMMENT	'文件编号',
  wjtm	varchar(255) DEFAULT NULL COMMENT	'文件题名',
  rq	varchar(255) DEFAULT NULL COMMENT	'日期',
  yc	varchar(255) DEFAULT NULL COMMENT	'页次',
  bz	varchar(255) DEFAULT NULL COMMENT	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '申请办理地址';

-- ----------------------------
-- Table structure for lc_yszgyj
-- ----------------------------
DROP TABLE IF EXISTS lc_yszgyj;
CREATE TABLE lc_yszgyj (
  id varchar(32) NOT NULL,
  lxh	varchar(255) DEFAULT NULL COMMENT	'立项号',
  slh	varchar(255) DEFAULT NULL COMMENT	'受理号',
  lah	varchar(255) DEFAULT NULL COMMENT	'立案号',
  gcmc	varchar(255) DEFAULT NULL COMMENT	'工程名称',
  gcdz	varchar(255) DEFAULT NULL COMMENT	'工程地址',
  jsdw	varchar(255) DEFAULT NULL COMMENT	'建设单位',
  sgdw	varchar(255) DEFAULT NULL COMMENT	'施工单位',
  ajjs	varchar(255) DEFAULT NULL COMMENT	'案卷卷数',
  zpcs	varchar(255) DEFAULT NULL COMMENT	'照片册数',
  dazgyj	varchar(255) DEFAULT NULL COMMENT	'档案整改意见',
  jg	varchar(255) DEFAULT NULL COMMENT	'机关',
  rq	varchar(255) DEFAULT NULL COMMENT	'日期',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '建设工程档案验收整改意见';

-- ----------------------------
-- Table structure for lc_ysscyj
-- ----------------------------
DROP TABLE IF EXISTS lc_ysscyj;
CREATE TABLE lc_ysscyj (
  id varchar(32) NOT NULL,
  	bh	varchar(255) DEFAULT NULL COMMENT	'编号',
	jsdw	varchar(255) DEFAULT NULL COMMENT	'建设单位',
	gcmc	varchar(255) DEFAULT NULL COMMENT	'工程名称',
	gcdz	varchar(255) DEFAULT NULL COMMENT	'工程地址',
	ghxkz	varchar(255) DEFAULT NULL COMMENT	'规划许可证',
	ghyshgz	varchar(255) DEFAULT NULL COMMENT	'规划验收合格证',
	jsgm	varchar(255) DEFAULT NULL COMMENT	'建设规模',
	scyj	varchar(255) DEFAULT NULL COMMENT	'审查意见',
	jg	varchar(255) DEFAULT NULL COMMENT	'机关',
	dzgz	varchar(255) DEFAULT NULL COMMENT	'电子公章',
	rq	varchar(255) DEFAULT NULL COMMENT	'日期',
	bz	varchar(255) DEFAULT NULL COMMENT	'备注',
  by1 varchar(255) DEFAULT NULL COMMENT '备用字段1',
  by2 varchar(255) DEFAULT NULL COMMENT '备用自段2',
  by3 varchar(255) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '建设工程档案验收审查意见';