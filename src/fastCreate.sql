--수업진도를 나가다가 booklist memberlist rentlist가 나가리됐을때 실행하는 sql문


--일단 깔끔히 지워버리자
drop table rentlist purge;
drop table booklist purge;
drop table memberlist purge;

create table booklist(
	booknum number(5),  --varchar2는 mysql에는 없음
	subject varchar2(30) not null,
	makeyear number(4), --4바이트가 아니고 숫자 4자리를 의미
	inprice number(6) not null,
	rentprice number(6) not null,
	grade varchar2(15),
	constraint booklist_pk primary key (booknum)
	
);

create table MemberList(
	memberNum number(5) not null ,
	name VARCHAR2(30) not null,
	Phone VARCHAR2(13) not null,
	Birth DATE,
	Bpoint NUMBER(6),
	gender varchar2(3),
	age number(2),
	constraint member_pk primary key (memberNum) 
);

create table rentlist(
	numseq number(3), --대여기록번호
	rentdate date default sysdate, --대여날짜
	bnum number(5) not null, --대여해간 도서번호
	mnum number(5) not null, -- 대여한 회원의 회원번호
	discount number(4) default 500, --할인금액
	constraint rent_pk primary key(numseq),
	constraint fk1 foreign key(bnum) references booklist(booknum),
	constraint fk2 foreign key(mnum) references memberList(memberNum)
);


--시퀀스도 지워버리고 새로만들기
drop sequence member_seq;
drop sequence rent_seq;
drop sequence book_seq;
create sequence book_seq start with 1 increment by 1;
create sequence member_seq start with 1 increment by 1;
create sequence rent_seq start with 1 increment by 1;

--booklist 값 10개 추가
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

--memberlist 값 10개 추가 (본인의 insert구문 사용해도 괜찮음)
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

-- rentlist 값 10개 추가인데 여기서 주의할점!!
-- 강의노트대로라면 booklist내 값들을 몇번 지웠다 넣어서 bnum이 10 초과하는 것에 대해서는 위에 새로 만드는 과정에서 없는 것이기 때문에
-- 아래 데이터 값들을 10 이하의 값들로 변경해주어야 한다
-- 예를들어 insert into rentlist values(rent_seq.nextVal,'2020/11/18',  13,7,100);
-- '날짜'다음에 13이라는 값이 만약 온다면 이것은 10초과한 값이기 때문에 rentlist의 fk1에 위반해서 insert가 실패(failed)한다. 아래와 같이 수정해주자
insert into rentlist values(rent_seq.nextVal,'2024/04/10', 7,2,100);
insert into rentlist values(rent_seq.nextVal,'2024/04/08', 7,3,100);
insert into rentlist values(rent_seq.nextVal,'2023/10/04', 8,4,200);
insert into rentlist values(rent_seq.nextVal,'2021/11/07', 8,2,100);
insert into rentlist values(rent_seq.nextVal,'2023/09/08', 9,6,200);
insert into rentlist values(rent_seq.nextVal,'2023/10/01', 10,6,300);
insert into rentlist values(rent_seq.nextVal,'2020/11/18',  5,7,100);
insert into rentlist values(rent_seq.nextVal,'2018/09/02',4,9,100);
insert into rentlist values(rent_seq.nextVal,'2024/10/01', 2,10,100);
insert into rentlist values(rent_seq.nextVal,'2020/06/23',6,5,100);

--07_DML_Update에 각종 update구문(드래그해서 한번에 바꿔주기)
update booklist set grade = '18' where subject='봉제인형 살인사건';
update booklist set grade = '18' where subject='봉제인형%';
update booklist set grade = '18' where subject='%살인사건';
update booklist set grade = '18' where subject='%인형%';
update booklist set rentprice=(rentprice*1.1);
update memberlist set bpoint=(bpoint+30) where bpoint>=300;
update memberlist set birth='00/01/01',age=23 where birth is null;
update memberlist set gender = 'M' where gender is NULL;
delete from rentlist where discount<=10;
alter table rentlist drop constraint fk1;
alter table rentlist add constraint fk1 foreign key(bnum) references booklist(booknum) on delete cascade;
alter table rentlist drop constraint fk2;
alter table rentlist add constraint fk2 foreign key (mnum) references memberlist(membernum) on delete cascade;