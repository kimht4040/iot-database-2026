-- 책 중에 가장 비싼 도서의 이름을 조회하시오

select max(b.price)
from Book b;


select b1.bookname
from Book b1
where b1.price >= (select max(b.price) from Book b);