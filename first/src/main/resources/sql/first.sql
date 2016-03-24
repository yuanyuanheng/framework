create database first;

DROP TABLE IF EXISTS Original;
CREATE TABLE Original
(
   id varchar(32) not null,
   url  text not null,
   content text,
   urlOld text,
   code varchar(10),
   status int,
   primary key(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
