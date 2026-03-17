-- group by
-- 주문정보에서 각고객별 총판매액을 조회하시오

select sum(t.TotalPrice)
from (select o.custid,
             sum(o.saleprice) AS "TotalPrice"
      from Orders o
      group by custid
      having TotalPrice > 20000)t
group by t.custid with rollup;




-- 롤업 없이 합산 구현
SELECT o.custid, sum(o.saleprice) AS "TotalPrice"
  FROM Orders o
 GROUP BY o.custid
HAVING TotalPrice > 20000
 UNION
SELECT NULL, sum(t.TotalPrice)
  FROM (SELECT o.custid, sum(o.saleprice) AS "TotalPrice"
        FROM Orders o
       GROUP BY o.custid
      HAVING TotalPrice > 20000) t;