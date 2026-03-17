
-- create

-- table
-- newbook 테이블 생성
create table NewBook(
    bookid integer,
    BOOKNAME varchar(20),
    publisher varchar(20),
    price decimal(10,2)
);
-- 컬럼은 대소문자 구분없지만 테이블이나 객체명은 대소문자 구분함
-- mysql 해당버전의 특징


-- 테이블 삭제
drop table NewBook;


-- 제약조건을 지정해줌
 create table NewBook(
    bookid integer primary key ,
    BOOKNAME varchar(20) not null ,
    publisher varchar(20) not null ,
    price decimal(10,2) not null
);

commit;

insert  into NewBook(bookid, BOOKNAME, publisher, price)
values (1, '야구의 추억', '대한미디어', 9000);
insert  into NewBook(bookid, BOOKNAME, publisher, price)
values (2, '골프 바이블', '한국미디어', 1100);


-- 제약 조건을 밑에 따로 지정
-- 기본키를 복합키로 설정할 경우 반드시 이 방법으로 해야함
create table NewBook(
    bookid integer,
    BOOKNAME varchar(20) not null ,
    publisher varchar(20) not null ,
    price decimal(10,2)  default 10000 check ( price > 1000 ),
    primary key (bookid, BOOKNAME)
);

commit;

