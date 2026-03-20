-- 트랜잭션 기본

-- 계좌 테이블 생성
create table accounts(
    id integer primary key,
    owner varchar(40),
    balance bigint
);

-- 데이터 추가
insert into accounts (id, owner, balance)
values (1, 'kim' ,10000),
       (2, 'lee', 20000),
       (3, 'sung', 30000000);



-- 트랜잭션 사용순서
start transaction;
commit;
rollback;



-- 1. kim 계좌에서 1000원 출금
start transaction;

savepoint p1; -- 세이브 포인트 설정하여 롤백시 해당위시 시점으로 이동
update  accounts
set balance = balance - 1000
where id = 1;




rollback to p1;

-- kim -> lee 송금
start transaction;
savepoint p2;
update accounts
set balance = balance +1000
where id = 3;
savepoint p3;
update accounts
set balance = balance -1000
where id = 1;

rollback;
select *
from accounts;
commit;



-- 4. kim -> lee 송금 중 문제 발생
savepoint p2;
update accounts
set balance = balance +1000
where id = 2;

savepoint p3;

update accounts
set balance = balance -1000
where id = 1;

rollback to p2;
select *
from accounts;
commit;


-- 현재 mysql db엔진 종류 확인
-- InnoDB, MyISAM(옛날거임)
-- MyISAM - 트랜잭션 처리 필요 없음
show table status  like 'accounts';

-- 현재 실행중 트랜잭션 조회 쿼리(root만 가능)
select  * from information_schema.INNODB_TRX it;





