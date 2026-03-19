

-- 1. 한번도 대여되지 않은 영화를 조회(영화가 가게에 없는 겨우도 대여되지 않은 영화임)
select f.title, r.rental_id, f.film_id
from film f
left outer join inventory i
on f.film_id = i.film_id
left outer join rental r
on i.inventory_id = r.inventory_id
where rental_id is null;

-- 2. 가장 많이 대여된 영화
-- mysql 조인은 내부조인을 외부조인으로 변경하는데 시간이 많이 소요됨
select f.title, count(r.rental_id) as "rc"
from film f, inventory i , rental r
where f.film_id = i.film_id and
      i.inventory_id = r.inventory_id
group by  f.title
order by rc desc;


-- 3. 직원별 총 매출을 조회하시오
select s.last_name ,s.staff_id, round(sum(p.amount),0) as "total_amount"
from staff s
join payment p
on s.staff_id = p.staff_id
group by s.staff_id
order by total_amount desc;


-- 4. tom miranda 출연한 영화 목록을 조회하시오
select first_name, last_name, title,
       film.language_id,
       (select name from language
            where language.language_id=film.language_id) as "영화언어"
from film
join film_actor
on film.film_id = film_actor.film_id
join actor
on film_actor.actor_id = actor.actor_id
where last_name = 'miranda' and
      first_name = 'tom';


-- 5. 새 고객 홍길동 추가
select *
from customer;

insert into customer(store_id, first_name, last_name, email, address_id, create_date)
values (2, '길동', '홍', 'gildong@naver.com', 5, now());


-- 6.gildong hong의 이메일 주소를 수정
update customer
set email = 'gildong@gamil.com'
where customer.customer_id= 601;


-- 7. 홍길동 비활성으로 전환
update  customer
set active = 0
where customer_id = 601;

-- 삭제
delete from customer
where customer_id = 600;


