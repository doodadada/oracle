-- 07_DML_Update

-- 데이터 변경  - 수정(update)
-- update 테이블명 set 변경내용 where 검색조건
select * from booklist;
update memberlist set age = 30, phone='010-0000-1111' where membernum=3; --where 없으면 모든 데이터가 set  변경내용으로 변경
--update set/select from /insert into

--명령문에 where 이후 구문은 생략이 가능합니다.
-- 다만 이부분을 생략하면 모든 레코드를 대상으로해서 update 명령이 실행되어 모든 레코드가 수정됩니다.
-- 검색조건 : 필드명(비교-관계연산자) 조건값으로 이루어진 조건연산이며, 흔히 자바에서if()
-- if 괄호안에 사용했던 연산을 그대로 사용하는게 보통입니다.
-- 나이가 29세 이상 -> where age >= 29
-- 두개 이상의 필드를 수정하고자 한다면(,)로 구분해서 기술합니다
-- 복합 조건을 사용하고자 한다면 and, or등을 사용합니다 (&& -> and, || -> or, ! -> not)


-- booklist 테이블의 도서 제목 '봉제인형 살인사건' 도서의 grade를 '18' 으로 수정하세요
update booklist set grade = '18' where subject='봉제인형 살인사건';
update booklist set grade = '18' where subject='봉제인형%';
update booklist set grade = '18' where subject='%살인사건';
update booklist set grade = '18' where subject='%인형%';
--시작,끝,포함
-- booklist의 모든 도서의 대여가격(rentprice)를 10% 이상으로 인상한 값으로 수정하세요
update booklist set rentprice=(rentprice*1.1);
-- memberlist에서 사은포인트(bpoint)가 300 이상인 회원의 bpoint에 30점을 가산해주세요
update memberlist set bpoint=(bpoint+30) where bpoint>=300;
select * from MEMBERLIST;
-- 생년월일이 null인 회원의 생년월일을 2000-01-01로, age를 23으로 변경하세요
update memberlist set birth='00/01/01',age=23 where birth is null;
-- gender가 null인 회원의 gender를 'M'으로 변경하세요 
update memberlist set gender = 'M' where gender is NULL;

select * from memberlist;

