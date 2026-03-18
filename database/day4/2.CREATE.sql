-- create 계속


--
drop table  NewBook;

-- newbook, neworder newcustomer 생성

create table NewBook (
    bookid integer primary key,
    bookname varchar(40) not null ,
    publisher varchar(40),
    price decimal(10,2) default 10000
);

create table NewCustomer(
    custid integer ,
    custname varchar(40) ,
    address varchar(120) not null ,
    phone varchar(20) not null,
    primary key (custid)
);


create table NewOrder (
    orderid integer primary key ,
    custid integer not null ,
    bookid integer,
    saleprice decimal(10,2),
    orderdate datetime,
    foreign key (custid) references NewCustomer(custid) on delete cascade,
    foreign key (bookid) references NewBook(bookid) on delete cascade
);


-- oldbook
create table OldBook(
    bookid integer primary key auto_increment,
    bookname varchar(40) not null ,
    publisher varchar(40),
    price decimal(10,2)
);

insert into OldBook (bookname, publisher, price)
values ('프로젝트 헤일메리', '대한미디어', 22000);





-- 관리자 계정에서 데이터 베이스도 생성 가능
create database testdb;
-- 사용자, 뷰 , 인덱스 등등 생성 가능





