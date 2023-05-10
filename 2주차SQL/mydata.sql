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
student_id	char(3) NOT NULL, -- 학생 id (FK)
foreign key (student_id) references student(id),
date		date, -- 구매날짜
item_id		char(3) NOT NULL, -- 구매품 등록번호
foreign key (item_id) references item(id),
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
insert into buy values('001','2022-01-23','003',1);
insert into buy values('002','2023-02-12','001',6);
insert into buy values('003','2021-10-07','002',2);
insert into buy values('004','2022-01-16','005',3);
insert into buy values('004','2021-01-27','006',10);
insert into buy values('004','2023-01-29','002',9);
insert into buy values('005','2022-02-21','007',6);
insert into buy values('006','2022-05-05','005',4);
insert into buy values('006','2022-05-06','005',3);
insert into buy values('001','2022-09-21','003',7);
insert into buy values('008','2021-10-17','001',3);
insert into buy values('009','2023-03-16','002',6);
insert into buy values('008','2022-07-13','004',8);
insert into buy values('009','2022-08-09','008',3);
insert into buy values('010','2023-02-10','009',2);
insert into buy values('010','2023-02-27','007',4);
insert into buy values('002','2022-04-06','010',2);
insert into buy values('004','2022-06-15','010',1);
insert into buy values('003','2023-02-23','002',8);
insert into buy values('008','2022-12-03','006',2);
insert into buy values('006','2023-03-22','004',4);
insert into buy values('007','2022-01-18','003',1);

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
where addr in('서울','경기'); -- addr이 서울 또는 경기
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


-- 3. Order by 절
select student_id, date, amount from buy
order by student_id;  -- student_id가 빠른 순서대로 출력
 -- order by 컬럼명 asc(오름차순) <또는> desc(내림차순)  --> 디폴트는 asc(오름차순)
 
 select * from student;
 select name, sex, height, weight, addr from student  -- name, sex, height, weight, addr을 뽑음
 where age >= 15 -- age는 15세 이상
 order by height desc, addr asc; -- 1. 키는 큰 순서대로 2. 키가 같으면 주소지 이름 순서대로 정렬

 
  -- limit 형식
  -- 1. limit 시작, 개수
  -- 2. limit 개수 offset 시작
  select * from student
  limit 5; -- 전체 중 앞에서 5건만 조회
  
  select name, height, weight from student
  order by age
  limit 0,3; -- 는 limit 3과 같은 의미로 0을 생략해서 쓸 수 있다.
  
  select name, height, weight from student
  order by age
  limit 3,5; -- 3번째 열부터 5개 데이터 조회
  
  select name, height, weight from student
  order by age
  limit 5 offset 3; -- 5개 데이터 조회, 3번째 열부터 시작
  
  -- dictinct : 중복된 결과 제거
  select addr from student;
  
  select addr from student
  order by addr;
  
  select distinct addr from student;
   

-- 4. Group by 절, 집계함수
select * from buy;
select student_id, amount from buy
order by student_id;  -- order의 결과

select student_id 학생아이디, sum(amount) 총구매수 from buy
group by student_id;

select avg(amount) from buy; -- 평균구매개수
select count(*) from student; -- 전체 학생 수
select count(addr) from student; -- 주소가 있는 학생 수


  -- having 절 : group by 의 조건 절
select student_id 학생아이디, sum(amount) 총구매수 from buy
group by student_id
having sum(amount) >= 10; -- 학생별 총 구매수가 10개 이상인 학생을 조회


select student_id 학생아이디, sum(amount) 총구매수 from buy
group by student_id
having sum(amount) >= 10
order by sum(amount) desc; -- 총 구매 수가 많은 학생순으로 조회



-- 5. 데이터 입력 : INSERT
select * from student;
insert into student values ('011', '이지은', '여', 19, 167, 54, '서울', '01035329503');
-- 열 이름 생략할 경우 create한 컬럼 순서에 맞게 데이터 입력해야 함

insert into student (id, name, sex, age, height, weight) values ('012','김동준','남',23,179,85);
-- NULL값이 가능한 addr 과 phone은 입력하고 싶지 않다면 입력할 컬럼을 제시한 후 데이터를 입력해야 한다.
-- 이 경우 입력하지 않은 addr 과 phone에 대해서는 NULL값이 자동으로 들어간다.

insert into student (name, id, age, sex, height, addr, phone, weight) values ('이현우','013',20,'남',175,'부산','01142045930',68);
-- 열의 순서를 바꿔서 입력하려면 열 이름과 값을 원하는 순서에 맞춰서 쓰면 된다.



-- join
select student_id '학생 아이디', item_id '구매품 번호', name '구매품 이름' , price '구매품 가격', sum(amount) '총 구매 수량', (price * sum(amount)) '구매 가격' from buy
inner join item
on buy.item_id = item.id    -- buy 테이블과 item 테이블 inner 조인 / 참조키 활용함
group by item_id, student_id -- item_id와 student_id 별로 조회
order by student_id; -- 학생순으로 조회

