create database first;

DROP TABLE IF EXISTS Original;
CREATE TABLE Original
(
   map_key  text not null,
   map_value text,
   key_old text,
   value_type varchar(10),
   status int
)ENGINE=INNODB DEFAULT CHARSET=utf8;
