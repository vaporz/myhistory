alter table news add column truth int(11) not null default 0;
alter table news add column fake int(11) not null default 0;
alter table keyword add column wiki_url varchar(2046) not null default '';
