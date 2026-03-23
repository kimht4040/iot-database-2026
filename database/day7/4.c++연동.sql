-- cpp 연동용 테이블
create table students(
    idx int primary key  auto_increment,
    name varchar(40) not null,
    score int not null ,
    reg_dt datetime default now()

);

insert into students(name, score)
values ('홍길동', 90);

select *
from students
