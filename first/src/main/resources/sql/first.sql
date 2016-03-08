create database first;

DROP TABLE IF EXISTS Original;
CREATE TABLE Original
(
   map_key  varchar(255) not null,
   map_value text,
   PRIMARY KEY (map_key)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
