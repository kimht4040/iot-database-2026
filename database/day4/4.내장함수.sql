/*내장함수*/

-- 수학함수

select abs(-78), abs(78)
from dual; -- 테이블을 사용하지 않을 때 사용하는 키워드

-- 반올림
select round(3.141592, 3);

-- 고객별 평균 주문금액을 백원단위로 반올림하시오
select o.custid as'고객번호', round(sum(saleprice)/count(*),-2) as '평균 주문금액'
from Orders o
group by o.custid;

-- 내림
select ceil(3.14);
-- 올림
select floor(3.67);
-- 거듭제곱
select power(2, 6);
-- 로그
select log(10);



-- 2.문자함수
-- 결합함수 파라미터 갯수 제한이 없음
select concat('성', ' ', '유고', '만세!');

-- 소문자 대문자 변환
select lower('HelLo'), upper('hello');


-- 자리수 채우기
select lpad('hello',10, '*'),
       rpad('hello',10,'@'); -- 주민번호 생년월일-성별이후 여섯자리*



-- 문자열대체
select replace('hello world', 'hello','bye');

-- 문자열 자르기
select substr('Hello world', 7, 5);

-- 문자열 앞뒤 공백 없애기(중간 공백 제외)
select concat('|',trim('                 sdf sdf                  '),'|') "trim",
       concat('|',ltrim('                 sdf sdf                  '),'|') "ltrim",
       concat('|',rtrim('                 sdfs df                  '),'|') "rtrim";


-- 구분자로 지정하여 문자열합치기
select concat_ws('-','2026','03','18');

-- 알파벳을 아스키 코드 변환
select ascii('a');

-- 문자열 길이 리턴
-- 한글 1글자 utf-8에서 3byte, 글자길이와 저정되는 바이트 길이는 다름
select length('안녕하세요 ');


-- 3. 날짜 시간함수
-- 날짜 문자열을 날짜형식으로 변환
select str_to_date('2024-03-18', '%Y-%M-%D');



-- 현재 일시
select sysdate(), now();


-- 날짜 함수 포맷
/*
    %y : 네자리 년도 2026
    %y : 두자리 년도 26
    %m : 월
    %M : 월이름(december)
    %b : 월이름(dec)
    %d : 일
    %W : 요일
    %w : 요일 숫자(0(일요일)~6)
    %h : 12시간
    %H : 24시간
    %i : 분
    %s : 초
*/

select date_format(now(), '%Y-%m-%d %W');




