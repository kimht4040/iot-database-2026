-- 인덱스

-- 인덱스 생성용 테이블
create table Noidx_book(
    book integer,
    book_name varchar(40),
    publisher varchar(40),
    isbn varchar(13),
    releaseyear integer,
    price decimal(10,2)
);


create table Idx_book(
    book integer,
    book_name varchar(40),
    publisher varchar(40),
    isbn varchar(13),
    releaseyear integer,
    price decimal(10,2),
    primary key(book)
);
-- 인덱스 걸기
create unique index idx_book on Noidx_book(book);

-- pk가 있으면 pk 컬럼은 not null
insert into Idx_book values (1, '프로젝트 헤일메리', '미디어', '1234567891011', 2022, 18000);

-- 유니크만 있으면 null 가능
insert into Noidx_book values (null, '프로젝트 헤일메리', '미디어', '1234567891011', 2022, 18000);

-- pk  인덱스가 있는 Idx_book 에 다른 인덱스 생성
create index idx_book_bookname on Idx_book(book_name);



-- 두 컬럼으로 인덱스
create index  idx_book_isbn_releaseyear on Idx_book(releaseyear, isbn);
-- 인덱스는 만들고나면 수정 불가 삭제 후 다시 생성해야함
drop index idx_book_isbn_releaseyear on Idx_book;




