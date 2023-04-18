-- 1번. userTBL 테이블에서 성이 김 씨인 회원의 이름과 키 조회
select * from ex1.usertbl;
select username, height from ex1.usertbl
where username like '김%';

-- 2번. userTBL 테이블에서 키가 큰 순서로 정렬하되 키가 같으면 이름 순서로 조회
select * from ex1.usertbl;
select username, height from ex1.usertbl
order by height, username;

-- 3번. userTBL 테이블에서 중복 지역을 조회하되 한번만 출력
select * from ex1.usertbl;
select distinct addr from ex1.usertbl;

-- 4번. buyTBL 테이블에서 아이디(userID)마다 구매한 물건의 개수(amount)를 조회
select * from ex1.buytbl;
select userid 아이디, sum(amount) '구매한 물건 총합' from ex1.buytbl
group by 1;

-- 5번. BuyTBL 테이블에서 제품 가격이 높은 순으로 전체 데이터를 조회하되 상위 3개만 조회
select * from ex1.buytbl;
select distinct prodname 제품이름, price 가격 from ex1.buytbl
order by price desc
limit 3;