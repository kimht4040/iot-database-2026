-- 두 개 이상 테이블에서 SELECT
-- natural join, inner join, join
select *
from Customer c
inner join Orders o
where o.custid=c.custid;
-- 불필요한 속성 없애고 표시 --mysql 조인 방식
select c.*,
    o.orderid, bookid, saleprice, orderdate
from Customer c, Orders o
where o.custid=c.custid -- 조인 조건
    and c.custid =3 -- 필터링 조건
order by c.custid desc;

-- 표준  sql 조인
select c.*,
    o.orderid, bookid, saleprice, orderdate
from Customer c
inner join Orders o
on c.custid=o.custid -- 조인 조건
where c.custid =3 -- 필터링 조건
order by c.custid desc;


-- 고객의 이름과 고객이 주문한 도서의 판매가격을 조회하시오
select name, sum(saleprice)
from Customer c
inner join Orders o
    on c.custid = o.custid
group by c.name;


-- 세 테이블을 조인해서 각 고객과 도서명을 모두 조회하시오
-- customer 테이블과book 테이블 간의 조인은 불가능함
-- 중간 매개체인 order 테이블을 이용해야함
select name, address, phone,
       bookname, publisher, saleprice
from Book
inner join Orders
on Book.bookid = Orders.bookid
inner join Customer
on Orders.custid = Customer.custid;




-- 외부조인
-- left outer join
-- 도서를 구매하지 않은 고객을 포함, 고객의 이름과 주문 도서의 판매가격을 조회하시오
select *
from Customer
left outer join Orders
on Orders.custid = Customer.custid
where orderid is NULL;

-- right outer join
select *
from Customer
right outer join Orders
on Orders.custid = Customer.custid;


-- 책 중에서 한번도 팔리지 않은 책정보와 같이 조회
select *
from Orders o right join Book b
on o.bookid = b.bookid;

-- 최종적으로 주문을 기준으로 일치하지 않는 고객과 책의 내용이 NULL표시됨
-- 하지만 주문이 가능하다는게 고객과 책이 있다는것이므로 NULL이 존재하지 않음
select *
from Customer c right outer join Orders o
on c.custid = o.custid
left outer join Book b
on o.bookid = b.bookid;

-- 최종적으로 book 이 기준이되어 일치하는 주문과 고객이 NULL 표시됨
select *
from Customer c right outer JOin Orders o
on c.custid = o.custid
right outer join Book b
on o.bookid = b.bookid;

-- 결과적으로 고객을 기준으로 일치하지 않는 주문과 고객이 NULL 표시됨
select *
from Customer c left outer JOin Orders o
on c.custid = o.custid
left outer join Book b
on o.bookid = b.bookid;

select o.custid,
       avg(o.saleprice),
       std(o.saleprice)
from Orders o
group by o.custid;

