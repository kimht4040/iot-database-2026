-- 프로시저 실행
call prc_insertbook(43, 'book', 'anan', 3000000);
select *
from Book;


-- 프로시저 실행

call prc_InsertOrUpdateBook(44, '스포츠의 즐거움', '마당체육', 25000);

select *
from Book;

call prc_InsertOrUpdateBook(44, '스포츠의 즐거움', '마당스포츠', 35000);

-- out 파라미터

select avg(price)
from Book
where price is not Null;

call prc_getAveragePrice(@myVal);
select @myVal;