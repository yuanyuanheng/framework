create database first;

DROP TABLE IF EXISTS Original;
CREATE TABLE Original
(
   id varchar(32) not null,
   link  text not null,
   state varchar(50),
   lastId varchar(32),
   code varchar(10),
   status int,
   level int,
   linkCount int,
   valid int,
   primary key(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

insert into Original values('76343b87d6bc4eb5b8994dffcb3369e0','68747470733a2f2f7777772e68616f3132332e636f6d2f','','','UTF-8',1,1,0,3);