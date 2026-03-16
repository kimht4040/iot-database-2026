-- 마당서점의 고객이 요구하는 다음 질문에 대해 SQL문을 작성하시오

-- (1) 도서번호가 1인 도서의 이름
select bookname as "도서의 이름"
from Book
where bookid=1;

-- (2)가격이 20000원 이상인 도서의 이름
select bookname as "도서의 이름"
from Book
where price>=20000;

-- (3) 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
select sum(saleprice) as "총구매액"
from Orders
where custid=1;

-- (4) 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
select count(*) as "도서의 수"
from Orders
where custid=1
order by custid;

-- 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오
-- (1)마당서점 도서의 총 개수
select count(*)
from Book;
-- (2) 마당 서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher)
from Book;
-- (3)모든 고객의 이름, 주소
select name, address
from Customer;

-- (4)2024년 7월 4일 ~ 7월 7일 사이에 주문 받은 도서의 주문번호
select *
from Orders
where orderdate between '2024-07-04' and
    '2024-07-07';

-- (5)2024년 7월 4일 ~ 7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
select *
from Orders
where orderdate not between '2024-07-04' and
    '2024-07-07';

-- (6)성이 '김'씨인 고객의 이름과 주소
select name, address
    from Customer
where name like '김%';


-- (7)성이 김씨고 이름이 아 로 끝나는 고객의 이름과 주소
select name, address
    from Customer
where name like '김%아';









