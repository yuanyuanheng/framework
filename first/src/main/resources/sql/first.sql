create database first;

DROP TABLE IF EXISTS Original;
CREATE TABLE Original
(
   map_key  varchar(255) not null,
   map_value longtext,
   value_type varchar(255),
   status int,
   PRIMARY KEY (map_key)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
