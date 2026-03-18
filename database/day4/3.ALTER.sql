-- ALTER 객체 수정

-- newbook 테이블에  ISBN 컬럼을 추가 하기

alter table NewBook
add isbn char(13);


-- 임시데이터 추가
insert into NewBook values(1, '프로젝트 헤일메리', '알에이치', 22000,'9788925588735');


select * from NewBook;

-- newbook에 장르 컬럼을 추가하시오
alter table NewBook
    add genre varchar(10) not null;

-- 이전의 데이터에 empty가 추가된 후 컬럼이 추가됨
select genre
from NewBook
where bookid =1;


-- newbook에 isbn을 삭제하시오
alter table  NewBook
drop column isbn;

select *
from NewBook;


-- newbook publisher에 not null 제약조건을 추가하시오
alter table NewBook
modify publisher varchar(40) not null;


-- 기본키 추가는 alter로 거의 하지 않음
alter table NewBook
add primary key (bookid);



-- DROP
drop table OldBook;

-- 관계형 db에서는 관계를 맺고 있는 부모테이블을 바로 삭제 불가능
-- 자식을 먼저 지우고 부모를 지워야함
drop table NewOrder;
drop table NewBook;






