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


-- 트랜잭션 사용가능 여부 확인
