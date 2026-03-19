/* 영화 대여 시스템*/


-- 1. ERD확인

-- 2. sakila 사용할 사용자 생성
-- 관리자 계정에서 실행해야함
create user 'sakila_user'@'%' IDENTIFIED by 'my123456';

-- 3.권한 설정
grant all privileges on sakila.* to 'sakila_user'@'%';
-- 권한 완전 적용
flush  privileges;


-- 4. sakila_user로 접속정보 생성

-- 5. 전체 고객수 조회

select count(*) as "total_customers"
from customer c;

-- 6. 가장 비싼 영화 top10
select f.title, f.replacement_cost
from film f
order by f.replacement_cost desc
limit 10;


-- 7. 고객별 총 결제금액을 조회하시오
select c.customer_id,c.first_name,c.last_name, sum(p.amount)
from customer c
inner join payment p
on c.customer_id = p.customer_id
group by c.customer_id,c.first_name,c.last_name
order by sum(p.amount);


-- 8.tom miranda라는 배우를 조회하시오
select *
from actor a
where a.first_name = 'TOM' and
      a.last_name = 'MIRANDA';

-- 9.영화별 출연 배우수를 조회
select f.title, count(*) as "배우 수"
from film f
left outer join film_actor f_a
on f_a.film_id = f.film_id
group by f.title;

-- 영화별 출연 배우수를 조회하면서 배우가 출연하지 않는 영화도 같이 조회하시오
select f.film_id, f.title,
       count(fa.actor_id) as "total_actors"
from film f
left outer join film_actor fa
on f.film_id = fa.film_id
group by  f.film_id, f.title
order by  total_actors desc;

-- 10. 카테고리별 영화
select c.name, f.title
from film_category fc
inner join film f
on f.film_id = fc.film_id
left outer join category c
on c.category_id = fc.category_id;


-- 11. 카테고리별 영화 수
select ifnull(c.name, '합계'), count(*) as "영화 수"
from film_category fc
inner join film f
on f.film_id = fc.film_id
left outer join category c
on c.category_id = fc.category_id
group by c.name with rollup;





