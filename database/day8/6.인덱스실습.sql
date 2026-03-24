-- 특정 고객의 최근 주문을 조회하시오

select *
from orders_big
where customer_id = 123456
order by order_date desc ;


-- 특정 기간에 특정 고객의 주문을 조회하시오
select*
from orders_big
where customer_id = 123456 and
      order_date between '2024-01-01' and '2025-12-31';


-- 서울이면서 특정 금액조건에 정렬해서 조회하시오

select *
from orders_big
where city = 'Seoul' and
      amount >= 900000
order by order_date desc;


-- 1. 실행 계획
explain analyze
select *
from orders_big
where customer_id = 123456
order by order_date desc;
/* 실행계획 결과
-> Sort: orders_big.order_date DESC  (cost=1.04e+6 rows=9.95e+6) (actual time=2790..2790 rows=26 loops=1)
    -> Filter: (orders_big.customer_id = 123456)  (cost=1.04e+6 rows=9.95e+6) (actual time=1258..2789 rows=26 loops=1)
        -> Table scan on orders_big  (cost=1.04e+6 rows=9.95e+6) (actual time=0.395..2500 rows=10e+6 loops=1)
*/

-- customer_id 와 order_date 에서 인덱스 걸리지 않아 scan에서 시간이 많이 소요

-- 인덱스 추가
-- 인덱스 테이블 생성에 6초 소요
create index idx_orders_customer_id on orders_big(customer_id);

/* 인덱스 추가 후 실행계획
-> Sort: orders_big.order_date DESC  (cost=28.6 rows=26) (actual time=1.16..1.16 rows=26 loops=1)
    -> Index lookup on orders_big using idx_orders_customer_id (customer_id=123456)  (cost=28.6 rows=26) (actual time=0.386..1.12 rows=26 loops=1)
*/

select *
from orders_big
order by customer_id;



-- 두번째 인덱스 추가
create index idx_orders_order_date on orders_big(order_date desc);
/* 두번째 인덱스 추가 후 실행계획
-> Sort: orders_big.order_date DESC  (cost=28.6 rows=26) (actual time=1.97..1.97 rows=26 loops=1)
    -> Index lookup on orders_big using idx_orders_customer_id (customer_id=123456)  (cost=28.6 rows=26) (actual time=0.449..1.93 rows=26 loops=1)
*/
-- 인덱스 제거
drop index idx_orders_order_date on orders_big;
drop index idx_orders_customer_id on orders_big;


-- 복합 인덱스 추가
create index idx_orders_customer_id_and_order_date on orders_big(customer_id, order_date);
