--개인 정보를 저장하는 테이블--
create table guestbook (
	num			number			primary key,
	name		varchar2(20)	not null,
	password	varchar2(20)	not null,
	contents	varchar2(1000)	not null,
	inputdate	date			default	sysdate
);

create sequence guestbook_seq;

insert into guestbook(num, name, password, contents) 
values (guestbook_seq.nextval, 'aaa', '111', '글내용');

select * from guestbook;

select num, name, contents, to_char(inputdate, 'YYYY-MM-DD HH:mm:SS') as inputdate from guestbook order by num desc;