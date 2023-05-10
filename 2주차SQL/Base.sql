/*
데이터 정의어 (DDL) : CREATE ALTER DROP RENAME TRUNCATE
테이블과 같은 데이터 구조를 정의하는데 사용되는 명령어들로 (생성, 변경, 삭제, 이름변경) 데이터 구조와 관련된 명령어들을 말함.

데이터 조작어 (DML) : SELECT INSERT UPDATE DELETE 
데이터베이스의 테이블에 들어 있는 데이터에 변형을 가하는 종류(데이터 삽입, 수정, 삭제)의 명령어들을 말함. 

데이터 제어어 (DCL) : GRANT REVOKE COMMIT ROLLBACK
데이터베이스에 접근하고 객체들을 사용하도록 권한을 주고 회수하는 명령어들을 말함.

DCL >>>> 트랜잭션 제어어 (TCL) : COMMIT ROLLBACK SAVEPOINT
		 논리적인 작업의 단위를 묶어서 DML에 의해 조작된 결과를 작업단위(트랜잭션) 별로 제어하는 명령어를 말함.
*/

select * from market_db.member
order by debut_date desc;

-- 멤버 숫자가 큰 회원부터 조회
-- 멤버 구성원이 5명 이상인
select * from market_db.member
where mem_number >= 5
order by mem_number desc;

-- 멤버 id 순으로 조회
select * from market_db.member
order by height desc, debut_date asc;


-- 서울, 경기 지역의 회원들 중에서 회원수가 많은 순서로 조회하되
-- 회원수가 같으면 이름 순서로 조회하기
select * from market_db.member
where addr in('서울', '경기')
order by mem_number desc, mem_name desc;


select distinct addr, mem_number, mem_name from market_db.member
where addr = '경기'
order by addr;

-- 지역, 구성원수, 이름순서로 조회
select * from market_db.member
order by addr, mem_number desc, mem_name desc;

select addr, mem_number 구성원수, mem_name as 이름
from market_db.member
-- order by addr, mem_number, mem_name;
-- order by addr, 구성원수, 3;
order by 1, 2, 이름;

-- 지역별 회원수
select addr, count(*)
from market_db.member
group by addr
order by addr;

select mem_id, amount from market_db.buy
order by 1;

select mem_id, sum(amount*price) from market_db.buy
group by 1;



-- -------------------------------------------------------------
select * from market_db.buy;

select sum(price) '가격 총합', max(price) '가격 최대값', min(price) '가격 최소값' , count(*) '개수', count(price), avg(price) '가격 평균', std(price) '가격 분산'
from market_db.buy;

-- buy에서 구매수량의 합, 최고값, 최소값, 건수 합
select sum(amount), max(amount), min(amount), count(amount)
from market_db.buy;

-- 회원 id별로
select sum(amount), max(amount), min(amount), count(amount)
from market_db.buy
group by mem_id;

-- 가격이 높은 순으로
select mem_id, sum(price) 가격
from market_db.buy
group by mem_id
order by sum(price) desc;
-- order by 가격 desc;
-- order by 2 desc;

select mem_id, price, amount, (price * amount) 구매금액 from market_db.buy;

-- 회원 id별로 구매금액 합
select mem_id 그룹이름, sum(price * amount) 구매금액합 from market_db.buy
group by mem_id;




select * from ex1.buytbl;
-- 전체 평균 구하기 (구매 평균)
select avg(amount) from ex1.buytbl;

-- buytbl에서 id마다 구매한 물건의 개수
select userid 유저아이디, sum(amount) '구매한 물건의 개수' from ex1.buytbl
group by userid;

-- 회원별로 한 번 구매할 때마다 평균적으로 몇 개를 구매했는가(group by)
select userid, avg(amount) from ex1.buytbl
group by userid
order by 2 desc;

-- 가장 키가 큰 회원과 가장 키가 작은 회원의 이름과 키 출력
select * from ex1.usertbl;

select username, height from ex1.usertbl
where height = (select max(height) from ex1.usertbl)
or height = (select min(height) from ex1.usertbl);

-- 또는 
select * from ex1.usertbl
where height in ((select max(height) from ex1.usertbl), (select min(height) from ex1.usertbl));

-- ------------------------------------------------------------------
select * from market_db.member;
select count(*) from market_db.member;
select count(phone1), count(phone2), count(mem_id), count(*) from market_db.member;
-- 주의사항 *** count(컬럼)을 할 경우 결측치 값을 제외한 (데이터값이 있는 입력 값만) 데이터 값만 개수를 세는 반면
-- 주의사항 *** count(*)을 할 경우 데이터의 모든 행의 개수를 세어줌.

-- 회원 id별로 구매금액합을 조회하되
-- 구매급액 합이 1000이상인 회원만 조회
-- 1. select alias 는 order by에만 사용
-- 2. 그룹함수(집계함수 : sum, count, min, max, avg...)는 having에만 사용
-- 3. group by 다음에 having을 사용
select mem_id, sum(price) 총구매금액
from market_db.buy
group by mem_id
having sum(price) >= 1000
order by 총구매금액 desc;

-- buytbl에서 아이디 별 총구매액 구하기
select * from ex1.buyWtbl;
select userid 아이디, sum(price * amount) '총 구매액' from ex1.buytbl
group by userid;

-- 총 구매액이 1000이상인 회원
select userid 아이디, sum(price * amount) '총 구매액' from ex1.buytbl
group by userid
having sum(price * amount) >= 1000;


use market_db;
create table hongong1 (toy_id INT, toy_name CHAR(4), age INT);
insert into hongong1 values (1,'우디', 25); -- 순서대로 입력시 컬럼명을 제시하지 않아도 됨
insert into hongong1 (toy_id, toy_name) values (2,'버즈');	-- age는 NULL값으로 생략함
insert into hongong1 values (Null, 'test', 10);
insert into hongong1 (toy_name, age, toy_id) values ('제시',20,3); -- 열의 순서를 바꿔입력 하여도 가능함
select * from hongong1;

-- example
create table testtbl1(id int, username char(3), age int);
-- 1. id와 이름, 나이 입력 (1,뽀로로, 16)
-- 2. id와 이름만 입력 (2, 크롱)
-- 3. 순서를 변경하고 입력 (루피, 14, 3)

insert into testtbl1 values (1, '뽀로로', 16);
insert into testtbl1 (id, username) values (2, '크롱');
insert into testtbl1 (username, age, id) values ('루피', 14, 3);

select * from testtbl1;


-- 자동으로 증가하는 auto_increment
create table hongong2(
	toy_id 		int auto_increment primary key, -- Auto_Increment로 지정한 컬럼은 무조건 PK로 지정해야함
    toy_name 	char(4),
    age 		int);

insert into hongong2 values (Null, '보핍', 25),(Null, '슬링키', 22),(Null, '렉스', 21);
select * from hongong2;

alter table hongong2 auto_increment=100; -- alter table은 테이블 변경문   -- 다음 자동 입력값을 4가 아닌 100(지정한 수)으로 변경
insert into hongong2 values (Null, '재남', 35);
select * from hongong2;


create table hongong3(
	toy_id	 	int auto_increment primary key,
	toy_name	char(4),
    age 		int
);
alter table hongong3 auto_increment=1000; -- 시작값 1000
set @@auto_increment_increment = 3; -- 증가값은 3으로 지정함

insert into hongong3 values (null, '토마스', 20),(null, '제임스', 23),(null, '고든', 25);
select * from hongong3;


use world;
-- city 테이블의 데이터는 몇 건인가
select * from world.city;
select count(*) from world.city;
select * from world.city limit 5;

-- 1. city_popul 생성 
-- 2. insert
-- 3. select count(*) from city_popul;
create table city_popul(
	city_name 	char(35),
    population	int
    );

insert into city_popul select name, population from world.city; -- 다른 테이블의 데이터를 가져오기
select count(*) from city_popul;


-- update 문
update city_popul
set city_name = '서울'
where city_name = 'Seoul';  -- Seoul을 서울로 변경

select * from city_popul
where city_name = '서울';

update city_popul
set city_name = '뉴욕', population = 0  -- 여러 열의 값 변경 : city_name 은 '뉴욕', population 은 0 으로 변경
where city_name = 'New York';

select * from city_popul
where city_name = '뉴욕';

-- update city_popul
-- set city_name = '서울'; -- where 절을 생략하면 테이블의 모든 행의 값이 변경되므로 주의!!!


select population from city_popul;
update city_popul
set population = population / 10000;
select * from city_popul limit 5;

select * from city_popul
where city_name = 'Kabul';


-- update Example
-- 1. buytbl 테이블에서 '운동화'를 '스니커즈' 로 수정
-- 2. buytbl 테이블에서 가격을 50% 인상 가격으로 수정
use ex1;

select * from buytbl;
update buytbl  -- 1.
set prodname = '스니커즈'
where prodname = '운동화';

update buytbl  -- 2.
set price = price * 1.5;

select * from buytbl;



-- 데이터 삭제 delete
delete from city_popul
where city_name like 'New%'; -- New로 시작하는 도시를 모두 삭제

select city_name from city_popul
where city_name like 'New%';

delete from city_popul
where city_name like 'New%' -- New로 시작하는 상위 도시 5개를 삭제
limit 5;



-- 대용량 테이블의 삭제
create table big_table1 (select * from world.city, sakila.country);
create table big_table2 (select * from world.city, sakila.country);
create table big_table3 (select * from world.city, sakila.country);
select count(*) from big_table1;

delete from big_table1; # 삭제가 비교적 오래걸림
drop table big_table2; # 테이블 자체도 삭제
truncate big_table3; # 테이블의 구조는 남겨두고 삭제

create table big_table2 (select * from world.city, sakila.country);
delete from big_table2 limit 5;


-- example
-- 1. big_table2 데이터를 big_table1 insert하기
insert into big_table1 select * from big_table2;
select count(*) from big_table1;
select count(*) from big_table2;



use market_db;
create table hongong4(
	tinyint_col		tinyint,
    smallint_col	smallint,
    int_cod			int,
    bigint_col		bigint);
    
insert into hongong4 values(127,32767,2147483647,9000000000000000000);
insert into hongong4 values(128,32768,2147483648,90000000000000000000); -- 오류 : Out of range : 입력값의 범위를 벗어남


select 08; -- number
select '08'; -- char

select 010; -- number
select '010'; -- char


use market_db;
select avg(price) as '평균 가격' from buy;

select cast(avg(price) as signed) '평균가격' from buy;
-- 또는
select convert(avg(price), signed) '평균 가격' from buy;


select cast('2022$12$12' as Date);
select cast('2022/12/12' as Date);
select cast('2022%12%12' as Date);
select cast('2022@12@12' as Date);

select num, cast(price as char), cast(amount as char), concat(cast(price as char), 'X', cast(amount as char), '=')
'가격X수량', price*amount '구매액'
from buy;

select '100' + '200';
select concat('100', '200');
select concat(100,'200');
select 100 + '200';

select concat('a', ' ', 'b', 'c');
select concat(mem_id, '/', mem_name) from market_db.member;
select 1>3, 100>3;

select bit_length('abc'), char_length('abc'), length('abc');
select concat(bit_length('가나다'), 'bits'), concat(char_length('가나다'), '글자'), concat(length('가나다'), 'bytes');

select now(), date(now()), time(now());



-- Join
-- 내부조인
select * from world.city, sakila.city; -- oracle

select * from world.city inner join sakila.city; -- ansi

select * from member inner join buy
on member.mem_id = buy.mem_id
where member.mem_id = 'GRL';


-- 마마무가 구매한 물건의 이름과 수량
select member.mem_name '그룹 이름', buy.prod_name '구매한 물건', sum(amount) '구매 수량' from member inner join buy
on member.mem_id = buy.mem_id
where member.mem_name = '마마무'
group by prod_name;


select mem_id, prod_name, sum(amount) from buy
group by mem_id, prod_name
order by 1;

-- buy테이블에서 이름이 'GRL'인 사람 조회
use market_db;
select * from buy
where mem_id like 'GRL';

-- GRL 조회
select * from member
where mem_id = 'GRL';

select B.mem_id '그룹 아이디', mem_name '그룹 이름', prod_name '구매 상품', addr '주소', concat('010',phone2) '전화번호' from buy B
inner join member M
on B.mem_id = M.mem_id
where B.mem_id = 'GRL';

select B.mem_id '그룹 아이디', mem_name '그룹 이름', prod_name '구매 상품', addr '주소', concat('010',phone2) '전화번호' from buy B
inner join member M
on B.mem_id = M.mem_id
order by M.mem_name, prod_name;

-- 중복
select distinct M.mem_id, M.mem_name, M.addr from buy B
inner join member M
on B.mem_id = M.mem_id
order by M.mem_id;

-- buytbl 과 usertbl 에서 한번이라도 구매이력이 있는 회원에게
-- sms발송 하려고 하낟
-- 필요한 회원정보 조회
use ex1;
select distinct B.userID, U.userName, U.addr from buytbl B
inner join usertbl U
on B.userID = U.userID
where mobile1 is not null; -- 전화번호 없는 사람은 제외한다!







-- 외부조인 Outer join
-- 구조는 다음과 같다
-- select <열 목록>
-- from <첫 번째 테이블(left 테이블)>
-- <left or right or full> outer join <두 번째 테이블(right 테이블)>
-- on <조인될 조건>
-- [where 검색 조건];

-- !!!!!!!!!! full outer join 은 mysql에서 구현되지 않음 !!!!!!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!! left + right outer join 으로 구현으로 볼 수는 있음 !!!!!!!!!!!!!!!!!



use market_db;
select B.mem_id '그룹 아이디', mem_name '그룹 이름', prod_name '구매 상품', addr '주소', concat('010',phone2) '전화번호' from buy B
-- inner join member M  -- 내부 조인
left outer join member M -- left 외부 조인
-- right outer join member M -- right 외부 조인
on B.mem_id = M.mem_id
order by prod_name;




-- Quiz
-- usertbl, buytbl
-- 1. 전체 회원의 구매 기록을 출력하되 구매 기록이 없는 회원도 출력
-- 2. 물건을 한 번도 구매한 적이 없는 회원의 목록 출력

-- 1.
use ex1;
select * from usertbl U
left outer join buytbl B
on B.userID = U.userID;

-- 또는
select * from buytbl B
right outer join usertbl U
on B.userID = U.userID;


-- 2.
select U.userID, userName, concat(mobile1, mobile2), prodName from buytbl B  -- usertbl U
right outer join usertbl U -- left outer join buytbl B
on B.userID = U.userID
where prodName is null;


-- buy와 member의 cross join
-- 테스트를 위한 대용량 데이터를 만들기 위해 쓰는 query
use market_db;
select count(*) from buy; -- 13
select count(*) from member; -- 12
select count(*) from buy cross join member; -- 156
select * from buy cross join member;

select count(*)
from sakila.inventory
cross join world.city;


-- self join 중요!
use market_db;
create table emp_table(emp char(4), manager char(4), phone varchar(8));
insert into emp_table values('대표',Null,'0000'),('영업이사','대표','1111'),
('관리이사','대표','2222'),('정보이사','대표','3333'),('영업과장','영업이사','1111-1'),('경리부장','관리이사','2222-1'),('인사부장','관리이사','2222-2'),
('개발팀장','정보이사','3333-1'),('개발주임','개발팀장','3333-1-1');

--
select manager from emp_table
where emp = '경리부장';

select phone from emp_table
where emp = '관리이사';


select * from emp_table;
select 직원.emp 부하직원, 매니저.emp 직속상관, 매니저.phone '직속상관 연락처'
from emp_table 직원
inner join emp_table 매니저
on 직원.manager = 매니저.emp
where 직원.emp = '경리부장';

--
drop table if exists member;
use market_db;
create table member(
mem_id		char(8) not null primary key,
mem_name	varchar(10) not null,
mem_nunmber	tinyint not null,
addr		char(2) not null,
phone1		char(3) null,
phone2		char(8) null,
height		tinyint unsigned null,
debut_date	date null);
insert into member values('TWC', '트와이스', 9, '서울','02','11111111',167,'2015-10-19'),('BLK','블랙핑크',4,'경남','055','22222222',163,'2016-8-8'),
('WMN','여자친구',6,'경기','031','33333333',166,'2015-1-15');
select * from member;




drop table if exists buy;
create table buy(
num			int auto_increment not null primary key,
mem_id		char(8) not null,
prod_name	char(6) not null,
group_name	char(4) null,
price		int unsigned not null,
amount		smallint unsigned not null,
foreign key(mem_id) references member(mem_id)
);
insert into buy values(null,'BLK','지갑', NULL,30,2),(null,'BLK','맥북프로','디지털',1000,1),(null,'TWC','아이폰','디지털',200,1);

select * from buy;






-- member 테이블 생성
-- 아이디		mem_id 	 문자8글자(자리수 고정) 필수컬럼 pk
-- 이름		mem_name 문자10글자 필수컬럼
-- 키 		height			필수아님

use market_db;
drop table if exists buy;
drop table if exists member;
create table member(
mem_id		char(8) not null primary key,
mem_name	varchar(10) not null,
height		tinyint unsigned default 160,
phone1		char(3),
email		char(30) null unique);

select * from member;

alter table member
alter column phone1 set default '02';
insert into member values('red', '레드벨벳', default, default, 'red@naver.com');
insert into member (mem_id,mem_name) values ('MMU','마마무');


drop table if exists buy;
create table buy
(num		int auto_increment not null primary key,
mem_id 		char(8) not null,
prod_name	char(6) not null
);
alter table buy
add constraint
foreign key(mem_id)
references member(mem_id);

insert into member values('BLK','블랙핑크',163);
insert into buy values(null, 'BLK', '지갑'),(null, 'BLK','맥북');

select M.mem_id, M.mem_name, B.prod_name
from buy B
inner join member M
on B.mem_id = M.mem_id;

delete from member where mem_id = 'BLK'; -- 오류