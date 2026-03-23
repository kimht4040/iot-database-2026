-- 로그테이블 생성
create table Book_log (
    bookid_l int,
    bookname_l varchar(40),
    publisher_l varchar(40),
    price_l int,
    dml_type varchar(10),
    dml_dt datetime default now()
);

select *from Book_log;


insert into Book values (45, '겨울왕국', '렛잇고', 18500);


update Book
set publisher = '디즈니',
    price = 20000
where bookid = 45;

delete  from Book
where bookid = 45;

