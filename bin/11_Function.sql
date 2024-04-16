-- 11_Function.sql

--[1] 샘플 테이블인 dual 테이블
select * from tab;
select * from dual;

--[2] 임시 데이터 출력
select 1234*1234 from dual;

-- *** 문자열 처리 관련 함수 **
-- loswer(), upper(), initcap()
select lower('Hong Gil Dong') as "소문자" from dual;
select upper('Hong Kil Dong') as "대문자" from dual;
select initcap('hong kil dong') as "첫글자만 대문자" from dual;



select lower(ename) as "이름" from emp;
select empno, upper(ename)as "이름" , job  from emp;

-- 이어붙이기 concat() : 문자열 연결
select concat('하이미디어 IT', '아카데미'), '하이미디어'||'아카데미' from dual;
select concat(empno, ename) from emp;

-- substr() : 문자열 추출(데이터, 인덱스(1), 카운트)
select substr('홍길동 만세',2,4) from dual; --길동 만
-- substr 의 경우 자바의 substring 처럼 시작번째부터 끝번째+1이 아니라
-- 시작 번째부터 글자수를 나타냅니다. 위의 예시 경우 2번째 글자부터 네글자 표시

-- *** 날짜 처리 관련 함수 ***
-- sysdate : 날짜
select sysdate from dual; --오늘 날짜와 현재 시간
-- insert 명령 그리고 그 외에 오늘 날짜가 필요한 곳에 폭넓게 사용됩니다
insert into rentlist(rentdate, numseq) values(sysdate, rent_seq.nextVal);

--months_between() : 개월 수 차 구하기
select floor(months_between('2021-12-31','2024-04-16')) as "개월수" from dual;

-- add_months() : 개월 수 더하기
select add_months(sysdate,20) from dual;	--2025-12-16 XXXX

-- next_day() : 다가올 요일에 해당하는 날짜 - 오늘 날짜(sysdate)에서 가장 가까운 일요일
select next_day(sysdate,'금') from dual;

-- last_day() : 해당 달의 마지막 날짜
select last_day(sysdate) from dual;
select last_day('2020-12-15') from dual;

-- to_char() : 문자(String)로 변환 Date->varchar2
select to_char(sysdate,'yyyy-mm-dd') as "Date->String" from dual;

--to_date() : 날짜형(Date)로 변환 varchar2->Date
select to_date('2019/12/31','yyyy/mm/dd') as "String -> Date" from dual;
--insert 명령에서 values() 괄호안에 많이 사용되는 함수

-- 숫자 -> 문자   세자리마다 컴마를 넣어서 반환
select to_char(123456789,'999,999,999') from dual; --123,456,789

--여섯자리 문자를 숫자로 변환
select to_number('123456') from dual;

-- YYYY -> 년도 표시
select to_char(sysdate, 'yy"년"') from dual; --> 24년
select to_char(sysdate, 'y"년"') from dual; --> 4년

-- month, mon-> 월표시
select to_char(sysdate, 'month') from dual; --> 4월
select to_char(sysdate, 'mon') from dual; --> 4월
select to_char(sysdate, 'mm') from dual; --> 04
select to_char(sysdate, 'mm"월"') from dual; --> 04월

-- dd 일자를 01~31로 표시
select to_char(sysdate, 'dd') from dual; --> 16
-- ddd 일자를 001~365 형태로 표시
select to_char(sysdate, 'ddd') from dual; --> 107
-- dl : 오늘날짜를 요일까지 표시
select to_char(sysdate, 'dl') from dual; --> 2024년 4월 16일 화요일

-- round() : 반올림(음수 : 소수점 이상 자리)
select round(12.3456, 3) from dual; --12.346
-- 12.3456 : 반올림하려는 대상 숫자	3 : 반올림하여 표시하고자하는 마지막 자리수

select * from MEMBERLIST;


