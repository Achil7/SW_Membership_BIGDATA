drop database if exists sqlbase1; -- 만약 sqlbase1 존재하면 우선 삭제
show databases; -- 또는 show schemas

create database sqlbase1; -- 데이터베이스 생성

use sqlbase1; -- sqlbase1 데이터베이스 사용

create table student( -- student 테이블 생성
id 		char(3) NOT NULL primary key, -- 학생 id
name 	char(9) NOT NULL, -- 학생 이름
sex 	char(1) NOT NULL, -- 성별
age		int, -- 나이
height	int, -- 키
weight	int, -- 몸무게
addr	varchar(2), -- 주소
phone	char(12) -- 핸드폰 번호
);

create table item( -- item 테이블 생성
id			char(3) NOT NULL primary key, -- 품목 id
name		varchar(10) NOT NULL, -- 품목 이름
price		int NOT NULL -- 품목 가격
);

create table buy( -- buy 테이블 생성
item_id		char(3) NOT NULL, -- 구매품 등록번호
foreign key (item_id) references item(id),
date		date, -- 구매날짜
student_id	char(3) NOT NULL, -- 학생 id (FK)
foreign key (student_id) references student(id),
amount 		int -- 구매품 수량
);

-- student 테이블 데이터 입력
insert into student values('001','김민수','남',18,175,65,'서울','01012384322');
insert into student values('002','이민호','남',19,185,80,'경기','01739583492');
insert into student values('003','한수지','여',17,167,57,'서울','01023485932');
insert into student values('004','박정민','남',17,176,70,'인천','01732423513');
insert into student values('005','박다현','여',15,152,45,'경기','01049819022');
insert into student values('006','최성호','남',15,165,65,'경기','01998234923');
insert into student values('007','이유정','여',14,150,40,'부산','01049283104');
insert into student values('008','김다니엘','남',20,183,85,'서울','01158194301');
insert into student values('009','김정문','남',19,175,68,'대전','01094194923');
insert into student values('011','김미연','여',17,184,76,'대구','01138184733');
insert into student values('100','김민해','남',18,172,67,'대전','01649133992');
select * from student;

-- id가 011인 학생의 데이터를 수정 < UPDATE >
update student set id = '010', name = '이지희', height = 164, weight = 54 where(id = 011);
select * from student;

-- id가 100인 학생의 데이터를 삭제 < DELETE >
delete from student where id = '100';
select * from student;

-- item 테이블 데이터 입력
insert into item values('001','snack',1000);
insert into item values('002','icecream',700);
insert into item values('003','beer',2500);
insert into item values('004','chocolate',500);
insert into item values('005','bread',1500);
insert into item values('006','coffee',1000);
insert into item values('007','coke',1500);
insert into item values('008','milk',600);
insert into item values('009','water',500);
insert into item values('010','candy',200);

-- buy 테이블 데이터 입력
insert into buy values('001','2022-01-13','001',3);
insert into buy values('003','2022-01-23','001',1);
insert into buy values('001','2023-02-12','002',6);
insert into buy values('002','2021-10-07','003',2);
insert into buy values('005','2022-01-16','004',3);
insert into buy values('006','2021-01-27','004',10);
insert into buy values('002','2023-01-29','004',9);
insert into buy values('007','2022-02-21','005',6);
insert into buy values('005','2022-05-05','006',4);
insert into buy values('005','2022-05-06','006',3);
insert into buy values('003','2022-09-21','001',7);
insert into buy values('001','2021-10-17','008',3);
insert into buy values('002','2023-03-16','009',6);
insert into buy values('004','2022-07-13','008',8);
insert into buy values('008','2022-08-09','009',3);
insert into buy values('009','2023-02-10','010',2);
insert into buy values('007','2023-02-27','010',4);
insert into buy values('010','2022-04-06','002',2);
insert into buy values('010','2022-06-15','004',1);
insert into buy values('002','2023-02-23','003',8);
insert into buy values('006','2022-12-03','008',2);
insert into buy values('004','2023-03-22','006',4);
insert into buy values('003','2022-01-18','007',1);

select * from student;
select * from item;
select * from buy;




-- 예제
-- 1. select ~ from ~ where 활용
select * -- * : 전체 출력
from student -- 테이블 이름
where sex = '남' and age = 19; -- 남자이면서 19세인 학생

select * from student
where height between 175 and 180; -- 키가 175이상 180 이하인 학생

select * from student
where height <= 170 and weight < 70 and sex = '남'; -- 키가 170 이하, 몸무게 70 미만이면서 남자인 학생

select name, height, addr from student -- 이름, 키, 주소만 뽑음
where height >= 180 or addr = '인천'; -- 키가 180 이상이거나 주소가 인천인 학생

select name, age, addr from student -- name, age, addr만 뽑음
where addr in('서울','경기'); -- addr의 서울 또는 경기
-- where addr = '서울' or addr = '경기'; -- 또 다른 방법

select name, phone from student
where phone like '010%';
-- 핸드폰번호가 010으로 시작하고 그 뒤는 무엇이든 허용한다(%)라는 의미이다.

select * from student
where phone like '01_3%'; -- 핸드폰 번호가 01_로 시작하고 중간번호가 3으로 시작

select * from student
where phone like '01_5_1%'; -- 핸드폰 번호가 01_로 시작하며 중간자리가 5_1에 해당하며 그 뒤는 무엇이든 가능

select id, name from student
where name like '김%'; -- 김씨 성을 가진 모든 학생

select id, name from student
where name like '김__'; -- 김씨 성을 가지며 이름이 세글자인 학생


-- 2. 서브쿼리
select name 이름, sex 성별, age 나이, height 키, weight 몸무게, addr 주소 from student
where height > (select height from student where name = '김민수');
-- 김민수 학생보다 키가 큰 학생들

select name 이름, sex 성별, age 나이, height 키, weight 몸무게, addr 주소 from student
where weight = (select max(weight) from student)
or weight = (select min(weight) from student);
-- 몸무게가 가장 많이 나가는 학생과 적게 나가는 학생
-- 또 다른 방법
-- where weight in ((select max(weight) from student), (select min(weight) from student));



