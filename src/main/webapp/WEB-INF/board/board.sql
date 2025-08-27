show tables;

create table board (
	idx int not null auto_increment,   /* 게시판 고유번호 */
	mid varchar(20) not null,          /* 게시판 올린사람 아이디 */
	nickName varchar(20) not null,		 /* 게시판 올린사람 닉네임 */
	title varchar(100) not null,       /* 게시글 제목 */
	content text not null,             /* 게시판글 내용 */
	hostIp varchar(30) not null,       /* 게시글 올린 PC IP */
	openSw char(2) default 'OK',       /* 게시글 공개여부(OK:공개, NO:비공개) */
	readNum int default 0,             /* 글 조회수 */
	wDate datetime default now(),      /* 글 올린 날짜 */
	good int default 0,								 /* 좋아요 클릭수 */
	complaint char(2) default 'NO',   /* 신고글(정상글:NO, 신고당한글:OK) */
	primary key(idx),
	foreign key(mid) references friend(mid)
);
desc board;

insert into board values (default, 'admin','관리맨','게시판 서비스를 시작합니다','즐거운 게시판 생활되세요','192.168.50.61',default,default,default,default,default);

select * from board;

-- 컬럼명 변경
ALTER TABLE board RENAME COLUMN compalaint TO complaint;

-- 데이터값 삭제
DELETE FROM board WHERE mid = 'je1234';

select *, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit 0,10;

select now(), datediff(now(), wDate) from board order by idx desc;

select *, 
	timestampdiff(hour, wDate, now()) as hour_diff,
	datediff(now(), wDate) as date_diff
	from board order by idx desc limit 0,10;
	
select * from board order by idx desc;
--이전글
select idx, title from board where idx < 9 order by idx desc limit 1;  
--다음글
select idx, title from board where idx > 9 order by idx limit 1;       

/* -----------------------------댓글처리-------------------------------------*/
create table boardReply (
	idx int not null auto_increment, /*댓글 고유번호*/
	boardIdx int not null,					/*부모글(원본글)의 고유번호*/
	mid varchar(20) not null,				/*댓글 올린이 아이디*/
	nickName varchar(20) not null,	/*댓글 올린이 닉네임*/
	wDate datetime default now(),		/*댓글 올린 날짜*/
	hostIp varchar(30) not null,		/*댓글 올린 pc의 고유ip*/
	content text not null,					/*댓글 내용*/
	primary key(idx),
	foreign key(boardIdx) references board(idx)
	on update cascade
	on delete restrict
); 
desc boardReply;

insert into boardReply values (default, 18, 'aaa1234','강짱',default,'192.168.50.61',"수고");

select * from boardReply order by idx desc;