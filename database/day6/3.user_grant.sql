
-- 사용자 생성
create user 'hugo'@'%' identified by 'my123456';


-- 사용자 비밀번호 변경
 alter user 'hugo'@'%' identified by 'my123456';

-- 권한 부여
grant all privileges on world.* to 'hugo'@'%';
grant all privileges on sakila.* to 'hugo'@'%';
grant all privileges on madangdb.* to 'hugo'@'%';

revoke all privileges on madangdb.* from 'hugo'@'%';

revoke all privileges on sakila.* from 'hugo'@'%';

revoke all privileges on world.* from 'hugo'@'%';
