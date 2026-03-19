-- cte



-- 일반 서브쿼리
select *
from (select o.custid, sum(o.saleprice) as "totalprice"
      from Orders o
      group by o.custid)t
where t.totalprice>31000;

with order_sum as (
    select o.custid, sum(o.saleprice) as "totalprice"
    from Orders o
    group by o.custid
),
    customer_sub as (
        select  Customer.name, Customer.address
        from Customer
    )

select  *
from customer_sub
where name = '박지성';


-- 1부터 10이 가상테이블에 생성
with recursive numbers as (
    select  1 as num
    union all
    select num + 1
    from numbers
    where num < 10
)
select *
from numbers





