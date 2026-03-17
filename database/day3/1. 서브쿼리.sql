-- 서브쿼리 종류

-- where절 서브쿼리
/* 서브쿼리를 사용해서 출판사 이름이 미디어로 끝나는 출판사에서
출판한 책을 조회
   */
select count(*)
from Book
where publisher in (select distinct publisher
    from Book
where publisher like '%미디어'
);


select distinct publisher
    from Book
where publisher like '%미디어';


-- 도서를 구매한 적이 있는 고객의 이름을 조회하시오
select name
    from Customer
where custid in (select distinct custid
from Orders);


-- 대한미디어에서 출판한 도서를 구매한 고객의 정보를 보이시오

select Customer.custid, name, address, phone
from Orders,Customer, Book
where publisher='대한미디어'and
      Book.bookid = Orders.bookid and
      Orders.custid = Customer.custid;


-- 도서 전체 평균값 보다 저렴한 책들을 조회하시오
select *
from Book b
where b.price<=(select avg(Book.price)
from Book);

-- 출판사별 가장 비싼 도서
select max(price), publisher
from Book
group by publisher;

-- any, some 결과 중 메인쿼리의 조건이 하나라도 참이면 출력
-- 출판사별 가장비싼 책과 가격이 하나라도 일치하는 책정보 조회하라
select *
from Book
where price >= any (select max(price)
                  from Book
                  group by publisher);


-- all == and  모든 결과가 일치해야함
-- 출판사별 가장비싼 책들과 가격이 모두 일치하는 책정보를 조회하라

select *
from Book
where price >= all(select max(price)
                  from Book
                  group by publisher);

-- exists
-- 서브쿼리 결과가 아무것도 없ㅇ으면 메인쿼리는 조회안됨
-- 서브쿼리 결과가 뭐라도 있으면 메인쿼리는 조회 가능
select *
from Book
where exists(select max(price)
             from Book
             group by publisher
             having  max(price) >40000);


-- 상관 서브쿼리(correlated subquery)
-- 메인쿼리의 컬럼이 서브쿼리의 조건에 포함될 때
-- 서브쿼리만 따로 실행 불가능
-- 출판사별 출판사 평균 도서가격보다 비싼 도서를 조회하세요

-- 참조쿼리
(select avg(b2.price)
                  from Book b2
                  where b2.publisher = b2.publisher);
-- 상관서브쿼리는 안쪽 서브쿼리만 따로 실행불가 코드 이해가 쉽지 않음
-- 사용을 지양
select *
from Book b1
where b1.price > (select avg(b2.price)
                  from Book b2
                  where b2.publisher = b1.publisher);



-- from절 서브쿼리
-- 서브쿼리로 만들어진 가상테이블을 진짜 테이블처럼 from절에 사용하는 것
-- 구매 고객별 합계 중에서 총 금액이 3만 이상인 구매건의 고객번호와 금액을 조회하세요
select *
from (select custid,sum(saleprice) as totalPrice
 from Orders
 group by custid) t
where t.totalPrice >=30000
order by t.totalPrice desc;

-- from절 서브쿼리는 일반 테이블 customer와 조인 가능


select Customer.name,t.totalPrice,t.custid
from (select custid,sum(saleprice) as totalPrice
 from Orders
 group by custid) t
inner join Customer
on t.custid = Customer.custid
where t.totalPrice >=30000
order by t.totalPrice desc;


-- 구매를 3번 이상한 고객만 조회하시오
select Customer.name, t.custid, t.order_cnt
    from(select o.custid, count(*) as order_cnt
    from Orders o
group by  custid) t
inner join Customer
on t.custid = Customer.custid
where order_cnt >= 3;

/*select절 서브 쿼리*/
-- 조인을 사용하지 않고 주문번호가 5이하인 주문건들의 고객명과 책이름을 같이 조회하시오

-- 조인 사용한 예시
select o.orderid,
       o.custid,
       o.bookid,
       o.saleprice
    from Orders o, Customer c, Book b
where o.custid = c.custid and
      o.bookid = b.bookid and
      o.orderid >=5;

-- 조인 사용안하고 select서브쿼리 사용
-- select 서브쿼리는 한행 한컬럼만 리턴되어야 함
select o.orderid,
       o.custid,
       (select name from Customer where Customer.custid = o.custid) as "고객명",
       (select Book.bookname from Book where Book.bookid = o.bookid) as "책이름"
from Orders o
where o.orderid >=5
order by orderid;







