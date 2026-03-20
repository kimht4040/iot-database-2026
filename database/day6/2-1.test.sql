-- Active: 1773388473742@@127.0.0.1@3306@madangdb


select @@autocommit;

set autocommit = 0;
-- Non-repeqtable Read
-- 격리 수준 하강
set session transaction isolation level read committed;
select  accounts.balance from accounts where id=1;
update accounts
set balance = balance -1000
where id = 2;

update accounts
set balance = balance -1000
where id = 3;



commit;


select *from accounts;



set autocommit = 0;
select @@autocommit;


-- Non-repeqtable Read
-- 격리 수준 하강
set session transaction isolation level read committed;

select *from accounts;

update accounts
set balance = balance -1000
where id = 1;


commit;


-- phantom read
insert into employees(name, salary)
values ('fghj', 7000),
       ('tyui', 8000),
       ('bnm', 9000);


-- 데드락
set autocommit = 0;
select @@autocommit;

select * from accounts;
-- 1번 계좌 1000원 차감
update accounts
set balance = balance -1000
where id = 1;



select *from accounts;

update accounts
set balance = balance -1000
where id = 2;

commit;
