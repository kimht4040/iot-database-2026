
-- NULL

select NULL;
select 100+NULL;

-- 전체 레코드를 선택하면 모두가 NULL이 아니기 때문에
-- 개수 카운팅 가능
-- price 컬럼만 봤을 때는 NULL 값은 카운팅 안됨
select count(*), count(price)
from Book;

insert into Book
values (14, '테스트', '테스트',null);


-- NULL은 비교연산 불가
select *
from Book
where price is NULL;

-- ISNULL, 해당값이 NULL 인지 확인
-- 1: NULL, 0: NULL이 아님



select *
, isnull(Book.publisher) as "아님",
  isnull(price) as "NULL"
from Book
where bookid = 14;

-- ifnull, 값이 null 일 경우 값을 대체

select *,
       ifnull(price,0)
from Book;
