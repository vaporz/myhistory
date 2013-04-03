CREATE TABLE news_keyword (
       news_id bigint(20) unsigned not null,
       keyword_id bigint(20) unsigned not null,
       keyword varchar(128) not null,
       keyword_lowercase varchar(128) not null,
       create_time bigint(20) not null default 0,
       PRIMARY KEY  (news_id, keyword_id)
   ) ;

CREATE TABLE keyword_news (
       keyword_id bigint(20) unsigned not null,
       news_id bigint(20) unsigned not null,
       news_time bigint(20) not null,
       PRIMARY KEY  (keyword_id, news_id),
       INDEX index_keyword_newstime (keyword_id, news_time)
   ) ;

CREATE TABLE keyword (
       keyword_id bigint(20) unsigned not null primary key,
       keyword_lowercase varchar(128) not null,
       keyword varchar(128) not null,
       alias_id bigint(20) unsigned not null default 0,
       hot int(11) not null default 0,
       create_time bigint(20) not null default 0,
    UNIQUE INDEX (keyword) 
   ) ;

CREATE TABLE news (
       news_id bigint(20) unsigned not null primary key,
       title varchar(256) not null,
       content varchar(4096) not null,
       url varchar(2046) not null default '',
       news_time bigint(20) not null,
       create_time bigint(20) not null default 0
   ) ;
CREATE TABLE id_index (
	id bigint unsigned auto_increment primary key
);