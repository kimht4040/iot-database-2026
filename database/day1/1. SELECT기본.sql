
select*from Book;

-- 모든 쿼리의 마지막은 ; 으로 끝냄
-- ;은 옵션이지만 무조건 사용하는게 좋음
select name,phone from Customer
where Customer.name='김연아';

-- 한줄 주석
/*
 여
 러
 줄
 주
 석
 */




-- 테이블에서 가져온 데이터가 아니면 FROM절 생략
select now();

-- 열 명시 가능
select bookname as b_n , Book.price as b_pr
from Book;

-- where절로 필터링 사용
select *from Customer
where custid >= 1 and custid < 5;


-- 정렬

select *from Book;

select * from Book
order by price;




select bookid, bookname, publisher, price
from Book;










