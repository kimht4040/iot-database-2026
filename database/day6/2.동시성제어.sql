-- 동시성 제어

-- 테이블 수정
start transaction;
alter table accounts
modify owner varchar(40) not null,
    modify balance integer not null;

truncate table accounts;

select *from accounts;

rollback ; -- truncate는 롤백안먹음


-- 데이터 다시 추가
insert into accounts (id, owner, balance)
values (1, 'kim' ,10000),
       (2, 'lee', 20000),
       (3, 'sung', 30000000);
commit;

select *from accounts;

-- 기본락 실행

savepoint p1;

update accounts
set balance = balance - 1000
where id = 2;

rollback to p1;


commit;




-- Non-repeqtable Read
-- 격리 수준 하강
set session transaction isolation level read committed;

select * from accounts;
update accounts
set balance = balance - 1000
where id = 2;

commit;

-- phantom read
-- 테이블 생성
create table employees (
    id integer primary key auto_increment,
    name varchar(50),
    salary integer
);
insert into employees(name, salary)
values ('asdf', 3000),
       ('qwer', 5000),
       ('zxcv', 6000);


select * from employees;

-- 데드락
-- 2번 id 계좌금액 1000원 차감
update accounts
set balance =  balance - 1000
where id = 2;



commit ;
-- 테이블락
lock tables  accounts read ;


select *from accounts;

update accounts
set balance = 9000
where id = 3;
unlock tables;
