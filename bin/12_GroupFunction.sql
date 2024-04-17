-- 12_GroupFunction.sql

-- 테이블내의 하나의 필드값을 전체로 하는 함수

select SUM(inprice) from booklist;

select sum(rentprice) as "대여가격합계" from booklist where inprice>=18000;


select * from memberlist;
select * from booklist;

-- 갯수(count)
select count(*) from memberlist;
select count(*) as "회원수" from memberlist where bpoint>=100;

-- 평균(AVG)
select round(avg(inprice),0) as "입고가격평균" from booklist;
-- to_char 로 변경된 숫자는 문자로 변경된 것이므로 이제 숫자로서의 기능이 상실됩니다. 다른 숫자와 계산 불가
select to_char(round(avg(inprice),0),'999,999,999') as "입고가격평균" from booklist;

--Max : 최댓값
-- sequence에 의해서 추가된 자동증가번호를 조회할때 많이 사용합니다.
select max(inprice) from booklist;

--Min : 최댓값
select min(inprice) from booklist;

-- GROUP BY
-- 그룹 함수의 결과들을 다른 필드의 그룹으로 재구성
select count(*) as "총 대여건수" from  rentlist;

-- 도서별 대여건수
select bnum as "도서번호", count(*) "도서별 대여건수" , sum(discount) as "할인금액합계"
from rentlist group by bnum order by bnum;

-- RENTLIST 테이블에서 대여일자(RENTDATE) 별 대여건수와 할인금액 평균
select rentdate as 대여일자, count(*) as 대여건수
from rentlist group by rentdate order by rentdate desc;

-- HAVING
-- 그룹핑된 내용들에 조건을 붙일 때
select rentdate as 대여일자, count(*) as 대여건수, avg(discount) as 할인금액평균
from rentlist
group by rentdate
having avg(discount)>=150
order by rentdate desc;





