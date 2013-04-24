CREATE TABLE IF NOT EXISTS news_keyword (
       news_id bigint(20) unsigned not null,
       keyword_id bigint(20) unsigned not null,
       keyword varchar(128) not null,
       keyword_lowercase varchar(128) not null,
       create_time bigint(20) not null default 0,
       PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS keyword_news (
       keyword_id bigint(20) unsigned not null,
       news_id bigint(20) unsigned not null,
       news_time bigint(20) not null,
       PRIMARY KEY  (keyword_id, news_id),
       INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS keyword (
       keyword_id bigint(20) unsigned not null primary key,
       keyword_lowercase varchar(128) not null,
       keyword varchar(128) not null,
       wiki_url varchar(2046) not null default '',
       alias_id bigint(20) unsigned not null default 0,
       hot int(11) not null default 0,
       create_time bigint(20) not null default 0,
    UNIQUE INDEX (keyword) 
   ) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS news (
       news_id bigint(20) unsigned not null primary key,
       title varchar(256) not null,
       content varchar(4096) not null,
       url varchar(2046) not null default '',
       news_time bigint(20) not null,
       truth int(11) not null default 0,
       fake int(11) not null default 0,
       create_time bigint(20) not null default 0
   ) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS id_index (
	id bigint unsigned auto_increment primary key
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS user_id_index (
	id bigint unsigned auto_increment primary key
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS user (
	user_id bigint(20) unsigned not null primary key,
	pwd varchar(128) not null,
	name varchar(128) not null,
	icon varchar(512) not null default '',
	credit int(11) not null default 0,
	email varchar(128) not null default '',
	locale varchar(32) not null default '',
	create_time bigint(20) not null default 0,
    UNIQUE INDEX (name) 
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS user_keyword (
	user_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	not_read int(11) not null default 0,
	last_modify_time bigint(20) unsigned not null,
	PRIMARY KEY  (user_id, keyword_id),
	INDEX index_time (user_id, last_modify_time)
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS keyword_user (
	keyword_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	create_time bigint(20) unsigned not null,
	PRIMARY KEY  (keyword_id, user_id)
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS message_board (
	msg_id bigint(20) unsigned not null auto_increment primary key,
	user_id bigint(20) unsigned not null default 0,
	user_name varchar(128) not null default '',
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS news_comment_id_index (
	id bigint unsigned auto_increment primary key
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS news_comment (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
