show tables;

desc customers;
desc books;
desc orders;

select * from customers;
select * from books;
select * from orders;

/* 도서 주문관리 프로젝트에 필요한 테이블 설계 */
/* 고객테이블 */
create table customers (
  custid   int not null AUTO_INCREMENT PRIMARY KEY,	/* 고객 고유번호 */
  customer varchar(20)  not null,			/* 고객명 */
  address  varchar(30)  not null,			/* 고객주소 */
  phone    varchar(15)  not null				/* 고객 연락처 */
);

/* 책정보 테이블 */
create table books (
  bookid    int not null AUTO_INCREMENT  PRIMARY KEY,	/* 책 고유번호 */
  bookname  varchar(30) not null,			/* 책이름 */
  publisher varchar(20) not null,			/* 출판사명 */
  price     int not null						/* 책가격(정가) */
);

/* 주문 테이블 */
create table orders (
  orderid  int not null AUTO_INCREMENT PRIMARY KEY,	/* 주문 고유번호 */
  custid   int not null,		/* 고객 고유번호(고객테이블의 고유번호이다.) */
  bookid   int not null,		/* 책 고유번호(책테이블의 고유번호이다.) */
  saleprice int not null,		/* 실제 책 구입가격 */
  orderdate TIMESTAMP,			/* 책 주문 날짜 */
  FOREIGN KEY(custid) REFERENCES customers(custid) on update RESTRICT,
  FOREIGN KEY(bookid) REFERENCES books(bookid) on update RESTRICT
);

/* 자료파일 */
-- books(책정보)
INSERT INTO books VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO books VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO books VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO books VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO books VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO books VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO books VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO books VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO books VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO books VALUES(10, 'Olympic Champions', 'Pearson', 13000);
INSERT INTO books VALUES(11, '가나다', '삼성당', 17500);
INSERT INTO books VALUES(12, '포토샵CS6', '제우미디어', 25000);
INSERT INTO books VALUES(13, '아시안게임 이야기', '스포츠북', 19500);
INSERT INTO books VALUES(14, '우리들 이야기', '우리출판사', 5000);
INSERT INTO books VALUES(15, '서로 사랑하자', '이상미디어', 18000);
INSERT INTO books VALUES(16, '하나된 마음으로', '대한미디어', 21000);
INSERT INTO books VALUES(17, '나눌수 있을때', '나무수', 9000);
INSERT INTO books VALUES(18, '함박눈 내리는날', '이상미디어', 15000);
INSERT INTO books VALUES(19, '나보다 축구를', '굿스포츠', 23000);
INSERT INTO books VALUES(20, '시작했을때 한번더', '삼성당', 19000);

-- customers(고객정보)
INSERT INTO customers VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customers VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO customers VALUES (3, '김말숙', '대한민국 강원도', '000-7000-0001');
INSERT INTO customers VALUES (4, '손흥민', '영국 토트넘', '000-8000-0001');
INSERT INTO customers VALUES (5, '박세리', '대한민국 대전',  '001-0011-0012');
INSERT INTO customers VALUES (6, '이순신', '대한민국 아산',  '001-0009-0007');
INSERT INTO customers VALUES (7, '소나무', '대한민국 청주',  '000-1100-0050');

-- orders(주문정보) 데이터 생성
INSERT INTO orders VALUES (1, 1, 1, 6000, '2019-08-01'); 
INSERT INTO orders VALUES (2, 1, 3, 21000, '2018-09-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2022-11-03'); 
INSERT INTO orders VALUES (4, 3, 6, 6000, '2020-06-04'); 
INSERT INTO orders VALUES (5, 4, 7, 19000, '2019-11-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2021-09-07');
INSERT INTO orders VALUES (7, 4, 8, 11000, '2019-03-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2021-07-08');
INSERT INTO orders VALUES (9, 2, 10, 9000, '2017-05-09');
INSERT INTO orders VALUES (10, 3, 18, 13000, '2024-10-11');
INSERT INTO orders VALUES (11, 7, 15, 15000, '2025-06-17');
INSERT INTO orders VALUES (12, 7, 20, 16000, '2024-12-19');
INSERT INTO orders VALUES (13, 3, 19, 23000, '2025-06-30');
INSERT INTO orders VALUES (14, 1, 16, 17000, '2024-11-21');
INSERT INTO orders VALUES (15, 4, 15, 13000, '2025-05-12');
INSERT INTO orders VALUES (16, 7, 10, 13000, '2024-09-24');
INSERT INTO orders VALUES (17, 1, 12, 23000, '2025-02-26');
INSERT INTO orders VALUES (18, 2, 11, 13000, '2024-09-16');
INSERT INTO orders VALUES (19, 4, 20, 13000, '2025-03-20');
INSERT INTO orders VALUES (20, 4, 15, 20000, '2025-04-26');
INSERT INTO orders VALUES (21, 7, 20, 17000, now());
INSERT INTO orders VALUES (22, 4, 17, 8000, now());

/* ------------------------------------------------*/alter
-- 1번이상 구매한 책들의 정보?(구매 날짜순 내림차순)
select * from orders;
select * from orders order by orderdate desc;

-- 1번이상 구매한 책들의 정보?(구매 날짜순 내림차순) + 중복된 책들은 배제(1번 출력)
select distinct bookid, orderid, orderdate, concat(year(orderdate),'-',month(orderdate),'-',day(orderdate)) from orders order by orderdate desc;
select * from orders GROUP BY bookid;
select * from orders GROUP BY custid order by orderdate desc;

-- 1번이상 구매한 사람들으 ㅣ정보를 구매테이블에서 확인?
select * from orders GROUP BY custid;

-- 1번이상 구매한 책들의 정보?(책 이름과 함께 출력)
select * from orders o, books b where o.bookid = b.bookid;
select * from orders o inner join books b on o.bookid = b.bookid;
select o.*, b.bookname from orders o, books b where o.bookid = b.bookid;

-- 1번이상 구매한 책들의 정보?(주문번호, 주문날짜, 책이름, 정가, 세일가) - 주문일자 내림차순
select o.orderid, o.orderdate, b.bookname, b.price, o.saleprice from orders o, books b where o.bookid = b.bookid;

-- 1번이상 구매한 책들의 정보?(주문번호, 주문날짜, 책이름, 정가, 세일가) - 주문일자 내림차순(최근에 구매한 책 3권만 출력)
select o.orderid, o.orderdate, b.bookname, b.price, o.saleprice from orders o, books b where o.bookid = b.bookid ORDER BY o.orderdate DESC limit 3;

-- 1번이상 구매한 책들의 정보?(주문번호, 주문날짜, 책이름, 정가, 세일가) - 주문일자 내림차순(중복된 책은 1회만 출력)
select o.orderid, o.orderdate, b.bookname, b.price, o.saleprice
	from orders o, books b
	where o.bookid = b.bookid
	group by o.bookid
	order by o.orderdate desc;

-- 책을 구입한 사람들의 이름/책이름/구매가격/구매날짜?
select c.customer, b.bookname, o.saleprice, o.orderdate
	from orders o, books b, customers c
	where o.bookid = b.bookid and o.custid = c.custid;
	
-- 책을 구입한 사람들의 이름/책이름/구매가격/구매날짜?(단, 구매자가 구매한 책의 권수와 함께 출력)
select c.customer, count(o.custid), b.bookname, o.saleprice, o.orderdate
	from orders o, books b, customers c
	where o.bookid = b.bookid and o.custid = c.custid
	group by c.customer;
	
-- 책을 구입한 사람들의 이름/책이름/구매가격/구매날짜?(단, 구매자가 구매한 책의 권수,구매 총금액, 구매 평균와 함께 출력)
select c.customer, count(o.custid), format(sum(o.saleprice),0), format(avg(o.saleprice),0), b.bookname, o.saleprice, o.orderdate
	from orders o, books b, customers c
	where o.bookid = b.bookid and o.custid = c.custid
	group by c.customer;
	
-- 책을 구입한 사람들의 이름/책이름/구매가격/구매날짜?(단, 구매자가 구매한 책의 권수,구매 총금액, 구매 평균와 함께 출력)
-- 단, 구매한 책이 4권 이상인 자료만 출력(구매일자 내림차순 출력)?
select c.customer, count(o.custid), format(sum(o.saleprice),0), format(avg(o.saleprice),0), b.bookname, o.saleprice, o.orderdate
	from orders o, books b, customers c
	where o.bookid = b.bookid and o.custid = c.custid
	group by c.customer having count(o.custid) >= 4
	order by o.orderdate desc;
	
-- 각 고객별로 주문한 도서의 총 판매액을 출력하되, 고객 이름순으로 출력하시오.(고객명, 총판매액)
select c.customer as 구매고객, sum(o.saleprice) as 총판매액
	from orders o, customers c
	where o.custid = c.custid
	group by c.customer
	order by c.customer;
	
-- 2025년에 최고로 많이 팔은 책의 이름, 출판사명과 권수를 출력?
select b.bookname, b.publisher, count(o.bookid)
	from order o, books b
	where o.bookid = b.bookid and year(orderdate) = '2025'
	group by b.bookname;
	
/* ---------------------------------------------------*/
-- 서브쿼리(Sub Query) : 하나의 SQL문장안에서 또다른 SQL문을 포함시키는것

/*
 * 서브쿼리는 괄호()로 묶어준다.
 * 1.select 컬럼명,(select ....) from 테이블명~
 * 2.select 컬럼명 from (select ...) ~~~
 * 3.select 컬럼명 from 테이블명 where 필드명 = (select ....)~~~
 * */
-- 도서를 한번이라도 구매한적이 있는 고객명을 출력하시오.
select c.customer, o.custid from orders o, customers c where o.custid = c.custid;	
select c.customer, o.custid from orders o, customers c where o.custid = c.custid group by o.custid;	
select custid, customer from customers where custid in (select custid from orders);

-- 구매한 도서중에서 가장 비싼 도서명은 어떤것인지, '도서명'과 '구매자'를 출력?
select (select bookname from books where bookid=orders.bookid) as bookname
	from orders order by saleprice desc limit 1;

-- '대한미디어'나 '삼성당'에서 출판한 도서를 구매한 고객의 이름?(서브쿼리를 사용할것)
select customer from customers
	where custid in (select custid from orders o
	where o.bookid in (select bookid from books where publisher = '대한미디어' or publisher ='삼성당'));

-- 1. '손흥민'이 구매한 도서의 이름, 정가, 구매가격, 할인받은금액(정가와 판매가격의 차)를 출력하시오.

-- 2. 고객별로 주문한 도서의 총수량과 총판매액을 구하시오. 이때 고객 아이디도 함께 출력하시오.

-- 3. 도서의 가격과 판매가격의 차이가 가장 많은 주문을 출력하시오.

-- 4. 고객별 평균 구매액을 구하시오. 단 출력은 고객명, 평균구매액을 출력하시오.

-- 5. '2025년 5월 1일' 이후부터 최근까지 판매된 책의 이름과 판매금액을 출력하시오.






	