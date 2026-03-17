-- INSERT

-- Book 테이블에 새 책을 추가 '스포츠의학', 출판사 한솔의학서적, 가격 90000원
insert into Book(bookid, bookname, publisher, price)
values (11, '스포츠의학','한솔의학서적', 90000);

commit;

select* from Book;

insert into Book(bookid, bookname, publisher)
values (12, '스포츠의학2','한솔의학서적' );



INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

insert into Book(bookid, bookname, publisher,price)
select  bookid, bookname, publisher, price
from Imported_Book;



-- UPDATE
-- Customer에서 고객번호 5번의 고객주소를 '대한민국 부산'으로 수정하시오
select * from Customer where custid =5;

SET SQL_SAFE_UPDATES=1; -- sql 안전모드 켜기

update Customer
    set address = '대한민국 부산'
        , phone = '010-1234-5678'
where custid = 5;


select * from Imported_Book
where bookid =22;



-- DELETE
delete  from book_copy
where  bookid=6;
commit;

create  table Customer_Copy
select  * from Customer;
commit;

select * from Customer_Copy;

-- 삭제여부 컬럼 추가, 실제로 운영시 isdel로 삭제 여부를 처리하고 실제로 삭제를 하지 않음
alter table Customer_Copy
add column  isdel char(1);

commit;




