-- 06_DML.sql

-- DML (Data Management Language) 데이터 조작 언어

-- 테이블에 레코드를 조작(추가, 수정, 삭제, 조회)하기 위한 명령어들
-- INSERT (추가)
-- UPDATE (수정)
-- DELETE (삭제)
-- SELECT (조회 및 선택)

--[1] 샘플 테이블 생성
create table exam01(
	deptno number(2),
	dname varchar2(15),
	loc varchar2(15)
);

select * from exam01;

--[2] 레코드 추가

-- 레코드 추가 방법 #1
insert into 테이블이름(필드명1, 필드명2, 필드명3 ....) values(값1,값2,값3,....);

-- 레코드 추가 방법 #2
insert into 테이블이름 values(값1, 값2, 값3, ....);

-- #1과 #2의 차이점
-- #1 : 필드명과 입력되어야 하는 값들이 1:1 매칭되어 입력됩니다
--		   필드명의 순서는 반드시 지켜야하는 것은 아니지만 나열된 필드명대로 값들의 순서는 맞춰서 입력합니다.
insert into exam01(deptno, dname, loc) values('기획부', 10, '서울'); X
insert into exam01(deptno, dname, loc) values(10, '기획부', '서울' ); O
insert into exam01(loc, deptno, dname) values('서울', 10, '기획부'); O

--			null 값을 허용하는 필드나, default값이 있는 필드는 생략하고 입력할 수 있습니다.
insert into exam01(deptno, dname) values (10, '기획부'); O

-- #2 : 모든 필드에 해당하는 값들을 최초에 테이블 생성시에 기술한 필드 순서에 맞게 모두 입력하는 방법입니다.
insert into exam01 values(10,'기획부','서울'); O
-- #2는 null 을 허용하는 곳을 비우고 입력할 수 없으며, null 이라도 직접 지정해야합니다
insert into exam01 values(10,null,'서울'); O

-- #1과 #2 공통으로 숫자는 그냥 쓰고 문자는 작은따옴표('')로 묶어서 표현합니다

delete from booklist; --테이블내의 모든 레코드를 삭제하는 명령

select * from booklist;

-- 위 두가지 방법 중 자유롭게 선택하여서, booklist 테이블에 10개의 레코드를 추가해주세요.
-- booknum 은 시퀀스를 이용합니다
-- grade 는 'all' '12' '18' 세가지만 골라서 입력해주세요. 자신이 만든 테이블에 grade가 없으면 입력하지 않아도 됩니다.

insert into booklist values (book_seq.nextVal,'가면산장 살인사건', 2018,13320,1500,'12');
insert into booklist values (book_seq.nextVal,'나미야 잡화점의 기적', 2017,13320,2000,'18');
insert into booklist values (book_seq.nextVal,'유튜브 영상편집', 2020,20700,2500,'all');
insert into booklist values (book_seq.nextVal,'이것이 자바다', 2017,30000,3000,'12');
insert into booklist values (book_seq.nextVal,'불변의 법칙', 2024,22500,2250,'all');
insert into booklist values (book_seq.nextVal,'일류의 조건', 2024,17820,1780,'12');
insert into booklist values (book_seq.nextVal,'모순', 2013,11700,1100,'18');
insert into booklist values (book_seq.nextVal,'코믹 메이플스토리 5권',2008,8500,850,'all');
insert into booklist values (book_seq.nextVal,'마법 천자문 6권',2008,7000,700,'all');
insert into booklist values (book_seq.nextVal,'국어사전', 2000,15000,500,'all');
select * from booklist;

-- memberlist에 10명의 데이터를 추가해주세요. (member_seq 이용)
insert into memberlist(membernum, name, phone) values(member_seq.nextVal,'홍길동','010-1111-2222');
insert into memberlist(membernum, name, phone) values(member_seq.nextVal,'청길서','010-3333-4444');
insert into memberlist(membernum, name, phone) values(member_seq.nextVal,'녹길남','010-5555-6666');
insert into memberlist(membernum, name, phone) values(member_seq.nextVal,'황길북','010-7777-8888');
insert into memberlist values(member_seq.nextVal, '추신수', '010-5656-1234', '84/07/07',240, 'M',28);
insert into memberlist values(member_seq.nextVal, '박현수', '010-4546-7871', '83/08/08',142, 'M',27);
insert into memberlist values(member_seq.nextVal, '송영태', '010-1802-9457', '89/02/03',660, 'M',37);
insert into memberlist values(member_seq.nextVal, '김미영', '010-4543-7564', '90/11/06',110, 'F',21);
insert into memberlist values(member_seq.nextVal, '류지현', '010-1345-9797', '88/07/27',250, 'F',24);
insert into memberlist values(member_seq.nextVal, '이재용', '010-4544-9999', '60/10/03',100, 'M',63);
select * from memberlist;


-- rentlist 테이블도 rent_seq를 이용해서 10개의 데이터를 추가해주세요
insert into rentlist values(rent_seq.nextVal,'2024/04/10', 7,2,100);
insert into rentlist values(rent_seq.nextVal,'2024/04/08', 7,3,100);
insert into rentlist values(rent_seq.nextVal,'2023/10/04', 8,4,200);
insert into rentlist values(rent_seq.nextVal,'2021/11/07', 8,2,100);
insert into rentlist values(rent_seq.nextVal,'2023/09/08', 9,6,200);
insert into rentlist values(rent_seq.nextVal,'2023/10/01', 10,6,300);
insert into rentlist values(rent_seq.nextVal,'2020/11/18',  11,7,100);
insert into rentlist values(rent_seq.nextVal,'2018/09/02',13,9,100);
insert into rentlist values(rent_seq.nextVal,'2024/10/01', 16,10,100);
insert into rentlist values(rent_seq.nextVal,'2020/06/23',14,12,100);

select * from rentlist;

commit -- 현재창에서 commit은 세미콜른은 붙이지 않습니다. 단일명령이고 다른 명령과 함께 사용하지 않는다는 뜻입니다.

-- 데이터베이스 백업명령
exp userid = scott/tiger file=abc.dmp log-abc.log

-- 데이터베이스 복원명령
imp userid = scott/tiger file=abc.dmp log-abc.log full=y

-- 오라클의 백업 명령과 복원 명령은 모두 command 창에서 실행합니다.