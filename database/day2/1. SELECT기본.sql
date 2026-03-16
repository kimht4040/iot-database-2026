-- 서점에 어떤 도서가 있는지 알고 싶다.
-- 모든 도서의 이름과 가격을 조회하시오.



select bookname,
       price
    from Book;


-- 모든 도서의 가격과 이름을 조회하시오
select price,
       bookname
    from Book;


-- 모든 도서의 도서번호, 도서명, 출판사, 가격을 조회하시오
select Book.bookid,
       Book.bookname,
       Book.publisher,
       Book.price
    from Book;


-- 도서 테이블의 모든 출판사를 조회하세요.
select DISTINCT -- 중복을 제거하는 명령어
    Book.publisher
    from Book;


-- WHERE 절
-- 가격이 10000이상 20000이하인 도서를 조회

select Book.bookname,
       price
from Book
where price between 10000 and 20000;


-- between은 and 로 변경가능
select Book.bookname,
       price
from Book
where price >= 10000 and
      price <= 20000;


-- 출판사가 굿스포츠, 대한미디어인 도서를 조회하시오
select *
from Book
where publisher IN('굿스포츠', '대한미디어');


-- or와 동일 단, 값이 너무 많으면 in절이 훨씬 효율적
select *
from Book
where publisher='굿스포츠' or
      publisher='대한미디어';

-- 출판사가 굿스포츠, 대한미디어가 아닌 도서를 조회
select *
from Book
where publisher not in ('대한미디어', '굿스포츠');


-- LIKE 패턴 필터링
-- 축구의 역사라는 이름을 출간한 출판사를 조회하시오
select bookname, publisher
from Book
where bookname ='축구의 역사';


-- 책 제목에 축구가 포함된 출판사를 조회하시오
select bookname, publisher
from Book
where bookname like '%축구%';

-- 책 제목이 축구로 시작하고 총 제목의 길이가 8자리
-- 책을 출판한 출판사를 조회하시오
select bookname, publisher
from Book
where bookname like '축구______';

-- 도서이름의 왼쪽 두번쨰 글자가 '구'인 도서를 조회하시오
select bookname, publisher
from Book
where bookname like '_구%';

-- 축구에 관한 도서중 가격이 20000원 이상인 도서를 조회하시오
select *
from Book
where bookname like '%축구%'
    and price >= 20000;


-- 도서를 이름순으로 조회하시오
select *
from Book
order by bookname;


-- 도서를 가격순으로 조회하시오
-- 가격이 같다면 이름순으로
select *
from Book
order by price, bookname;

-- 집계 함수 SUM
-- 2번 김연아 고객이 주문한 총 판매액을 조회하시오
select *
from Customer
where name = '김연아';



-- alias
select sum(saleprice) as "총 매출"
from Orders
where custid = 2;

select b.price as "가격"
from Book as b;

-- 고객이 주문한 도서의 총 판매액, 평균, 최고가 조회하시오
select sum(Orders.saleprice),
       avg(Orders.saleprice),
       min(Orders.saleprice),
       max(Orders.saleprice)
from Orders;


-- 마당 서점의 총 도서 판매수를 조회하시오
select count(*) "총 판매수",
       count(o.orderid) "총판매수"
    from Orders o;

-- GROUP BY 어느 고객이 얼마나 주문했는지 알고 싶음
-- 고객별로 주문한 도서의 총 수량과 총 판매액을 조회하시오
select c.name as "이름",
       count(*)as "판매 수량",
       sum(o.saleprice) as "총 판매액"
from Orders o, Customer c
where c.custid=o.custid
group by c.name;

-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문도서, 총 수량을 조회하시오
 -- 단 두권이상 구매한 고객만 조회합니다.
select c.name as "이름",
       count(*)
from Orders o, Customer c
where o.saleprice >= 8000 and
      c.custid=o.custid
group by o.custid
having count(*) >= 2;






