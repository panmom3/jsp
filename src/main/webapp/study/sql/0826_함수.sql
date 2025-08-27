show tables;

create table sungjuk (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	kor int,
	eng int,
	mat int
);

desc sungjuk;

insert into sungjuk values (default, '홍길동', 50, 40, 60);
insert into sungjuk values (default, '김말숙', 80, 90, 80);
insert into sungjuk values (default, '이기자', 60, 80, 70);
insert into sungjuk values (default, '강동원', 100, 90, 80);
insert into sungjuk values (default, '최강희', 80, 70, 50);
insert into sungjuk values (default, '강하늘', 80, 70, 80);

select * from sungjuk;

-- 집계함수(개수:count(), sum(), avg())
select count(idx) from sungjuk;
select sum(kor), sum(eng), sum(mat) from sungjuk;
select avg(kor), avg(eng), avg(mat) from sungjuk;

--as 변수지정 (vo에 등록)
select count(kor) as korCnt, sum(kor) as korSum, avg(kor) as korAvg from sungjuk;

-- 최대(max), 최소(min)
select max(kor) as korMax, min(kor) as korMin from sungjuk;

-- 문자열결합(연결) : concat()
select concat(max(kor),'점') as korMax, concat(min(kor),'점') as korMin from sungjuk;

-- 출력용 형식(format)지정 : format()
select avg(kor), avg(eng), avg(mat) from sungjuk;
select format(avg(kor), 1), format(avg(eng), 2), format(avg(mat), 3) from sungjuk;
select '1234567', format('1234567', 0);

-- 수치함수
select 123.456 as su;

-- 반올림 : round()
select 123.456 as su, round(123.456) as res;
select 123.456 as su, round(123.456, 1) as res;
select 123.456 as su, round(123.456, 2) as res;
select 129.456 as su, round(129.456, -1) as res;

-- 버림(절삭) : truncate()
select 123.456 as su, truncate(123.456, 0) as res;
select 123.456 as su, truncate(123.456, 1) as res;
select 123.456 as su, truncate(123.456, 2) as res;
select 123.456 as su, truncate(123.456, -1) as res;

-- 무조건 올림(정수로만 처리) : ceil(), 무조건 내림: floor()
select 123.456 as su, ceil(123.456) as res;
select 123.456 as su, floor(123.456) as res;

-- 나머지 : mod()
select mod(10,3) as na;

-- 거듭제곱(지수승) : power()
select power(2,5) as 2의5승;

-- 숫자 리스트중에서 가장큰값(), 가장작은값()
select greatest(15, 4, 21, 7, 9) as max;
select least(15, 4, 21, 7, 9) as min;

-- 문자함수
-- 문자열의 길이 : length() - 바이트단위  *유니코드 한굴 한글자 - 3바이트  / 공백은 1바이트
select length('seoul');
select length('서울'); 
select length(name), length(kor) from sungjuk; 

-- 실제 문자개수로 변환? char_length
select char_length('seoul');
select char_length('서울'); 
select char_length(name), char_length(kor) from sungjuk; 

-- 대문자(upper), 소문자(lower)
select 'seoul', upper('sEoUl'), lower('sEoUl');

-- 문자열발췌 : substring(데이터, 시작위치, 발췌개수) : 시작위치 1번부터 처리
select '1234567890', substring('1234567890', 1, 5);
select '1234567890', substring('1234567890', 2, 5);
select now(), substring(now(),1,10);
select now(), substring(now(),12,8);

-- 특정문자열의 유무 : instr() - 값이 있으면 위치값을, 없으면 0을 출력
select 'Welcome to Korea!!!', instr('Welcome to Korea!!!', 'K');
select 'Welcome to Korea!!!', instr('Welcome to Korea!!!', 'Z');
select 'Welcome to Korea!!!', instr('Welcome to Korea!!!', ' ');

-- 특정문자를 기준으로 이전까지만 출력
select substring_index('ab.cd.efg.h.ijkl.mn', '.', 1);
select substring_index('ab.cd.efg.h.ijkl.mn', '.', 2);
select substring_index('ab.cd.efg.h.ijkl.mn', '.', 3);

-- 왼쪽(오른쪽),중앙부터 지정길이만큼 문자 추출 : left(), right(), mid()
select 'abcdefg', left('abcdefg', 3), right('abcdefg', 3), mid('abcdefg', 3, 2);

-- 공백지우기 : trim(), ltrim(), rtrim()
select ' s e o u l ', trim(' s e o u l '), ltrim(' s e o u l '), rtrim(' s e o u l ');

-- 치환 : replace()
select 'Welcome to Korea!!!', replace('Welcome to Korea!!!', ' ', '_');

-- 채우기 : insert()
select '가나다라마바사아', insert('가나다라마바사아', 2, 3, '***');

-- 반복 : repeat()
select repeat('*', 10);
select repeat('abd', 10);
select repeat('abd/', 10);

-------------------------------------------------------------------------------
-- 날짜함수
select now();
select year(now()), month(now()), day(now());

select * from insa;

select name, ipsail from insa;
select name, ipsail, month(ipsail), day(ipsail) from insa;
select name, concat(year(ipsail),'년', month(ipsail),'월', day(ipsail),'일') from insa;
select name, concat(year(ipsail),'-', month(ipsail),'-', day(ipsail)) from insa;

-- 요일: 일요일(0), 월요일(1)...
-- 날짜 포멧형식(date_format) : y(년도2자리), Y(년도4자리), m(두자리 월), c(한자리 월), M(월을 문자로), d:일(두자리), e:일(한자리)
select now(), date_format(now(), '%y-%m-%d');
select now(), date_format(now(), '%Y-%m-%d');
select now(), date_format(now(), '%Y-%M-%d');
select now(), date_format(now(), '%Y년 %m월 %d일');
select ipsail, date_format(ipsail, '%Y-%c-%e') from insa;
select ipsail, date_format(ipsail, '%Y-%m-%d') from insa;

-- 날짜 연산: date_add(), to_days, datediff, timediff, timestampdiff()
select now(), date_add(now(), interval 1 day);
select now(), date_add(now(), interval -1 day);
select now(), date_add(now(), interval 24 hour);
select now(), date_add(now(), interval 10 hour);
select now(), date_add(now(), interval 1 month);
select now(), date_add(now(), interval 1 year);

select now(), now() - 1;
select now(), to_days(now()) - to_days('2025-8-1');
select name, ipsail, to_days(now()) - to_days(ipsail) from insa;

select now(), datediff(now(), '2025-8-1');
select now(), datediff(now(), wDate) from board order by idx desc;
select name, ipsail, datediff(now(), ipsail) from insa;


select now(), timediff(now(), '2025-8-26 9:30');

-- 시간차이(timestampdiff()) : 시(hour), 분(minute), 초(second) **새글(new)표시 사용시 적용
select now(), timestampdiff(hour, '2025-8-26 9:30', now());
select now(), timestampdiff(minute, '2025-8-26 9:30', now());
select now(), timestampdiff(hour, ipsail, now()) from insa;

-- 마지막 일자 구하기 : last_day()
select last_day(now());
select last_day('2025-2-5'), last_day('2024-2-5');











