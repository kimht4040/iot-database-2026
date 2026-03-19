-- 1.    각 고객의 custid와 총 구매금액을 조회하시오. 총 구매금액이 큰 고객부터 출력하시오.
select Orders.custid, sum(saleprice) as "totalprice"
from Customer
join Orders
on Customer.custid = Orders.custid
group by Orders.custid
order by totalprice desc;

-- 2.  주문한 고객의 이름, 책 번호, 판매가격, 주문일자를 조회하시오.
select name, bookid, saleprice, orderdate
from Orders
join Customer
on Orders.custid = Customer.custid;

-- 3.  전체 주문의 평균 판매가보다 높은 판매가격의 주문을 조회하시오. 주문번호, 고객번호, 책번호, 판매가격을 출력하시오.
select orderid, custid, bookid, saleprice
from Orders
where saleprice > (select avg(saleprice)from Orders);


-- 4.  고객별 총 구매금액이 50,000원 이상인 고객의 이름과 총 구매금액을 조회하시오.
select name, sum(saleprice) as "총구매금액"
from Orders
join Customer
on Orders.custid = Customer.custid
group by Orders.custid
having sum(saleprice) >= 50000;


