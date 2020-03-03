-- [ BbongnamuWiki 프로젝트 테이블 구조 ]

--회원 정보 테이블
create table tbl_user (
	num			number			primary key,				--식별번호
	id			varchar2(20) 	unique			not null,	--회원ID
	password	varchar2(100) 	not null,					--비밀번호
	salt		varchar2(5)		not null,					--비밀번호솔트
	type		varchar2(20)	default 'GENERAL'	not null--회원타입
		check (type in ('GENERAL', 'ADMIN', 'WITHDRAWAL'))
);
create sequence seq_user;

-- 위키 정보 테이블
create table tbl_wiki (
	num			number			primary key,	--식별번호
	title		varchar2(200)	not null		--제목
);
create sequence seq_wiki;

-- 위키 역사 정보 테이블
create table tbl_history (
	num			number			primary key,	--식별번호
	wikinum		number			not null,		--위키 식별번호
	usernum		number			not null,		--작성자 식별번호
	content		clob,							--내용
	explanation	varchar2(200),					--추가 설명
	writedate	date			default sysdate	not null,
	type		varchar2(20)	not null		--역사타입
		check (type in ('CREATE', 'UPDATE', 'REVERT', 'DELETE')),
	revertnum	number,							--롤백시 롤백한 위키의 넘버
	constraint history_fk_wiki foreign key(wikinum)
		references tbl_wiki(num) on delete cascade,
	constraint history_fk_user foreign key(usernum)
		references tbl_user(num) on delete set null,
	constraint histroy_fk_revert foreign key(revertnum)
		references tbl_history(num) on delete set null
);
create sequence seq_history;

select * from tbl_user;
select * from tbl_wiki;
select * from tbl_wiki_history;
delete tbl_user where id = 'chawnsnd';

