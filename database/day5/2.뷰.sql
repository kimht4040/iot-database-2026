-- 뷰
select *
from (select c.custid, c.name, b.bookid, b.price, o.orderid, o.saleprice, o.orderdate
      from Customer c
      join  Orders o
      on c.custid = o.custid
      join Book b
      on o.bookid = b.bookid
     )v
where v.custid = 4;

-- 뷰 생성
create view  v_orders as
select c.custid, c.name, b.bookid, b.price, o.orderid, o.saleprice, o.orderdate
      from Customer c
      join  Orders o
      on c.custid = o.custid
      join Book b
      on o.bookid = b.bookid;
-- 뷰 사용
select *
from v_orders v
where v.custid = 4;



-- v_book 생성
create view v_book as
select *
from Book;

insert into v_book
values (40,'에일리언 어스','파라마운트미디어', 20000 );

update  v_book
set publisher = '파라마운트미디어'
where bookid = 33;


-- 뷰 수정
create or replace  view v_orders as
select c.custid, c.name
from Customer c
join Orders o
on c.custid = o.custid
join Book b
on b.bookid = o.bookid;


--  뷰 삭제
drop view v_book;
