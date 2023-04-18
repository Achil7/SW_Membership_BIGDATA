/*
1번. 다음에서 RDBMS의 특징에 관해 잘못 설명한 것을 고르세요
(1) RDBMS에서는 기본 데이터를 저장하기 위한 구조로 테이블을 사용
한다
(2) 테이블은 표처럼 볼 수 있도록 행과 열로 구성된다
(3) 질의어(Query Language)를 사용해 데이터에 접근한다
(4) RDBMS는 관계형 데이터베이스이기 때문에 무결성 유지가 어렵다 >> 정답
*/

/*
2번. 데이터베이스 목록을 조회하는 sql에 대한 설명 중 올바른 것은?
1) Use schemas
2) Use tables
3) Show databases >> 정답
4) Show tables
*/

/*
3번. 아래의 DML, DCL, DDL 이 잘못 짝지워진 것은?
1) DDL : CREATE
2) DML : UPDATE
3) DCL : ROLLBACK
4) DCL : SELECT >> 정답
*/

/*
4번. 아래 조건에 맞춘 테이블을 생성하세요
1) Usertbl -- 유저 테이블
userID CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
userName VARCHAR(10) NOT NULL, -- 이름
birthYear INT NOT NULL, -- 출생년도
addr CHAR(2) NOT NULL,
mobile1 CHAR(3),
mobile2 CHAR(8),
height SMALLINT, -- 키
mDate DATE -- 회원 가입일

2) buyTBL -- 회원 구매 테이블
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
userID CHAR(8) NOT NULL, -- 아이디
prodName CHAR(6) NOT NULL, -- 물품명
groupName CHAR(4) , -- 분류
price INT NOT NULL, -- 단가
amount SMALLINT NOT NULL-- 수량
*/
create database ex1;
create table ex1.uesrtbl(
userID CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
userName VARCHAR(10) NOT NULL, -- 이름
birthYear INT NOT NULL, -- 출생년도
addr CHAR(2) NOT NULL,
mobile1 CHAR(3),
mobile2 CHAR(8),
height SMALLINT, -- 키
mDate DATE -- 회원 가입일
);
create table ex1.buytbl(
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
userID CHAR(8) NOT NULL, -- 아이디
prodName CHAR(6) NOT NULL, -- 물품명
groupName CHAR(4) , -- 분류
price INT NOT NULL, -- 단가
amount SMALLINT NOT NULL-- 수량
);


/*
5번. 아래 데이터를 등록한 후 데이터를 조회하는 SQL을 작성하세요

INSERT INTO userTBL VALUES('YJS', '유재석', 1972, '서울', '010', '11111111',
178, '2008-8-8');
INSERT INTO userTBL VALUES('KHD', '강호동', 1970, '경북', '011', '22222222',
182, '2007-7-7');
INSERT INTO userTBL VALUES('KKJ', '김국진', 1965, '서울', '019', '33333333',
171, '2009-9-9');
INSERT INTO userTBL VALUES('KYM', '김용만', 1967, '서울', '010', '44444444',
177, '2015-5-5');
INSERT INTO userTBL VALUES('KJD', '김제동', 1974, '경남', NULL ,
NULL , 173, '2013-3-3');
INSERT INTO userTBL VALUES('NHS', '남희석', 1971, '충남', '016', '66666666',
180, '2017-4-4');
INSERT INTO userTBL VALUES('SDY', '신동엽', 1971, '경기', NULL ,
NULL , 176, '2008-10-10');
INSERT INTO userTBL VALUES('LHJ', '이휘재', 1972, '경기', '011', '88888888',
180, '2006-4-4');
INSERT INTO userTBL VALUES('LKK', '이경규', 1960, '경남', '018', '99999999',
170, '2004-12-12');
INSERT INTO userTBL VALUES('PSH', '박수홍', 1970, '서울', '010', '00000000',
183, '2012-5-5');

INSERT INTO buyTBL VALUES(NULL, 'KHD', '운동화', NULL , 30, 2);
INSERT INTO buyTBL VALUES(NULL, 'KHD', '노트북', '전자', 1000, 1);
INSERT INTO buyTBL VALUES(NULL, 'KYM', '모니터', '전자', 200, 1);
INSERT INTO buyTBL VALUES(NULL, 'PSH', '모니터', '전자', 200, 5);
INSERT INTO buyTBL VALUES(NULL, 'KHD', '청바지', '의류', 50, 3);
INSERT INTO buyTBL VALUES(NULL, 'PSH', '메모리', '전자', 80, 10);
INSERT INTO buyTBL VALUES(NULL, 'KJD', '책' , '서적', 15, 5);
INSERT INTO buyTBL VALUES(NULL, 'LHJ', '책' , '서적', 15, 2);
INSERT INTO buyTBL VALUES(NULL, 'LHJ', '청바지', '의류', 50, 1);
INSERT INTO buyTBL VALUES(NULL, 'PSH', '운동화', NULL , 30, 2);
INSERT INTO buyTBL VALUES(NULL, 'LHJ', '책' , '서적', 15, 1);
INSERT INTO buyTBL VALUES(NULL, 'PSH', '운동화', NULL , 30, 2);
*/