CREATE TABLE IF NOT EXISTS id_index (
	id bigint unsigned auto_increment primary key
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS user_id_index (
	id bigint unsigned auto_increment primary key
) engine=InnoDB default charset=utf8;

CREATE TABLE IF NOT EXISTS news_comment_id_index (
	id bigint unsigned auto_increment primary key
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
	news_time_desc varchar(128) not null default '',
	truth int(11) not null default 0,
	fake int(11) not null default 0,
	create_time bigint(20) not null default 0
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

CREATE TABLE IF NOT EXISTS message_board (
	msg_id bigint(20) unsigned not null auto_increment primary key,
	user_id bigint(20) unsigned not null default 0,
	user_name varchar(128) not null default '',
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
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
#=============================
CREATE TABLE IF NOT EXISTS news_keyword_0 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_1 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_2 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_3 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_4 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_5 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_6 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_7 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_8 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_9 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_10 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_11 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_12 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_13 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_14 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_15 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_16 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_17 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_18 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_19 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_20 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_21 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_22 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_23 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_24 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_25 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_26 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_27 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_28 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_29 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_30 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_31 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_32 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_33 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_34 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_35 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_36 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_37 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_38 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_39 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_40 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_41 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_42 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_43 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_44 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_45 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_46 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_47 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_48 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_49 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_50 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_51 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_52 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_53 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_54 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_55 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_56 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_57 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_58 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_59 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_60 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_61 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_62 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_63 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_64 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_65 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_66 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_67 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_68 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_69 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_70 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_71 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_72 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_73 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_74 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_75 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_76 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_77 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_78 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_79 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_80 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_81 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_82 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_83 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_84 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_85 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_86 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_87 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_88 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_89 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_90 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_91 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_92 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_93 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_94 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_95 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_96 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_97 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_98 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_keyword_99 (
	news_id bigint(20) unsigned not null,
	keyword_id bigint(20) unsigned not null,
	keyword varchar(128) not null,
	keyword_lowercase varchar(128) not null,
	create_time bigint(20) not null default 0,
	PRIMARY KEY  (news_id, keyword_id)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_0 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_1 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_2 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_3 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_4 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_5 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_6 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_7 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_8 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_9 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_10 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_11 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_12 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_13 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_14 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_15 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_16 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_17 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_18 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_19 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_20 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_21 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_22 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_23 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_24 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_25 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_26 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_27 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_28 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_29 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_30 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_31 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_32 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_33 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_34 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_35 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_36 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_37 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_38 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_39 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_40 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_41 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_42 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_43 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_44 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_45 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_46 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_47 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_48 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_49 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_50 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_51 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_52 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_53 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_54 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_55 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_56 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_57 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_58 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_59 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_60 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_61 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_62 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_63 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_64 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_65 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_66 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_67 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_68 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_69 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_70 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_71 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_72 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_73 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_74 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_75 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_76 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_77 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_78 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_79 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_80 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_81 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_82 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_83 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_84 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_85 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_86 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_87 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_88 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_89 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_90 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_91 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_92 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_93 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_94 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_95 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_96 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_97 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_98 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS keyword_news_99 (
	keyword_id bigint(20) unsigned not null,
	news_id bigint(20) unsigned not null,
	news_time_desc varchar(128) not null default '',
	news_time bigint(20) not null,
	PRIMARY KEY  (keyword_id, news_id),
	INDEX index_keyword_newstime (keyword_id, news_time)
   ) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_0 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_1 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_2 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_3 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_4 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_5 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_6 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_7 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_8 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_9 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_10 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_11 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_12 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_13 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_14 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_15 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_16 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_17 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_18 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_19 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_20 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_21 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_22 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_23 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_24 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_25 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_26 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_27 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_28 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_29 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_30 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_31 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_32 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_33 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_34 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_35 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_36 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_37 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_38 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_39 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_40 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_41 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_42 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_43 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_44 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_45 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_46 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_47 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_48 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_49 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_50 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_51 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_52 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_53 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_54 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_55 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_56 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_57 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_58 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_59 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_60 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_61 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_62 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_63 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_64 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_65 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_66 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_67 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_68 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_69 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_70 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_71 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_72 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_73 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_74 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_75 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_76 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_77 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_78 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_79 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_80 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_81 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_82 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_83 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_84 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_85 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_86 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_87 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_88 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_89 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_90 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_91 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_92 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_93 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_94 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_95 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_96 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_97 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_98 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;
CREATE TABLE IF NOT EXISTS news_comment_99 (
	comment_id bigint(20) unsigned not null primary key,
	news_id bigint(20) unsigned not null,
	user_id bigint(20) unsigned not null,
	user_name varchar(128) not null default '',
	user_icon varchar(512) not null default '',
	is_login tinyint(4) not null default 0,
	content varchar(2048) not null default '',
	create_time bigint(20) unsigned not null
) engine=InnoDB default charset=utf8;

