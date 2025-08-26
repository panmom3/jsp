

/* 도서 주문관리 프로젝트에 필요한 테이블 설계 */
/* 고객테이블 */
create table customers (
  custid   int not null AUTO_INCREMENT PRIMARY KEY,	/* 고객 고유번호 */
  customer varchar(20)  not null,			/* 고객명 */
  address  varchar(30)  not null,			/* 고객주소 */
  phone    varchar(15)  not null			/* 고객 연락처 */
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


