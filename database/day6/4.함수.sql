
SET GLOBAL log_bin_trust_function_creators = 1;
select o.custid,
       o.orderid,
       o.bookid,
       o.saleprice,
       fnc_interest(o.saleprice),
       o.orderdate
from Orders o




-- 함수 사용
-- 1. 새로운 VIP 고객 후보(60,000원) 추가
-- 1. 새로운 주문 추가 (예: 25,000원짜리 주문 -> GOLD 예상)
INSERT INTO Orders (orderid, custid, bookid, saleprice, orderdate)
VALUES (11, 1, 1, 25000, STR_TO_DATE('2026-03-20', '%Y-%m-%d'));

-- 2. 방금 넣은 주문번호(orderid=11)의 등급 바로 확인하기
SELECT orderid,
       custid,
       saleprice,
       madangdb.fnc_balanceGrade(saleprice) AS order_grade
FROM Orders
WHERE orderid = 11;