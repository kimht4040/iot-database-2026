-- 합집합


-- 책테이블의 책이름과 가격, 고객 테이블의 고객명과 전화번호를 합하여 조회
-- uinon 사용시 컬럼명은 유니온 선언 전의 타입을 따라감
-- 컬럼의 타입 불일치로 오류가 날 수 있음(형변환 필요)
select Book.bookname, Book.price from Book
union
select Customer.name, Customer.phone from Customer;


-- book에 있는 데이터를 book_copy테이블로 복사하면서 생성
create table book_copy
select Book.bookid, Book.bookname, Book.publisher, price from Book;



select *from book_copy;


-- 책테이블과 책테이블 복사를 합쳐서 책이름과 가격을 조회하시오
-- union, union all 을 다 확인할 것
select Book.bookname as "대표명",
       Book.price as "금액전번"
from Book
union
select  book_copy.bookname,book_copy.price
from book_copy;