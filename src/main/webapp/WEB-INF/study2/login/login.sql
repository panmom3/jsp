show tables;

create table friend (
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	pwd varchar(20) not null,
	nickName varchar(20) not null,
	name varchar(20) not null,
	age int default 20,
	gender char(2) default '여자',
	address varchar(30),
	unique key(mid),
	unique key(nickName)
);

desc friend;
drop table friend;

insert into friend values (default, 'admin', '1234', '관리맨', '관리자', 33, '남자', '서울');

select * from friend;

-- UNIQUE KEY 추가
ALTER TABLE friend ADD UNIQUE KEY(nickName);
 -- UNIQUE KEY 삭제
ALTER TABLE friend DROP INDEX name;

DELETE FROM friend WHERE mid = 'je1234';