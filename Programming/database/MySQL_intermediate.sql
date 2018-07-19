-- 올림, 반올림, 내림
-- 조건문(if, when than, else)
-- 날짜 데이터 포멧팅: group by(일별로 데이터, 월별 데이터 ...)
-- 조인(JOIN) - inner, left, right
-- 유니온(UNION) - 두 개의 결과를 합치는 명령 - full outer(full outer은 union에서 됨)
-- Sub-query - select절, from절, where절에 들어가는 sql 구문
-- index - sql 쿼리를 빠르게 수행 할 수 있도록 하는 방법
-- view -복잡하지만 자주 사용되는 sql 구문을 임시로 만드는 테이블

-- use world

-- select ceil(12.34*10)*0.1 - 소수 몇째자리까지 한다 할 때는 이렇게 해 줘야함
-- select round(12.345,1)
-- select round(12.345,2)

-- select SurfaceArea, Population, round(population/SurfaceArea,2)
-- from country

-- select truncate(12.345,2)

# 도시인구가 100만이 넘는 "big city", 100 이하면 "small city"
-- select name, population, if(population>1000000, "big city","small city") as city_scale
-- from city
-- having city_scale="big city"

# 한국 도시인구가 100만이 넘는 "big city", 100 이하면 "small city"
-- select name, population, if(population>1000000, "big city","small city") as city_scale
-- from city
-- where countrycode = "KOR"
-- having city_scale="big city"

# 독립연도가 없는 데이터를 0으로 바꿔서 출력
-- select indepyear, ifnull(indepyear,0)
-- from country
-- limit 5

# case when then
# 나라 별로 인구가 10억 이상, 10억 ~ 1억, 1억 이하에 b,m,s 출력이 되도록
-- select name, population
-- , case
-- when population>1000000000 then "b"
-- when population>100000000 then "m"
-- else "s"
-- end as scale
-- from country
-- having scale= "m"
-- order by population desc

-- date format
# 월별 매출
-- select payment_date, date_format(payment_date,"%Y-%m") as monthly, sum(amount) as total
-- from payment
-- group by monthly

-- join
-- CREATE TABLE user (
-- user_id int(11) unsigned NOT NULL AUTO_INCREMENT,
-- name varchar(30) DEFAULT NULL,
-- PRIMARY KEY (user_id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- CREATE TABLE addr (
-- id int(11) unsigned NOT NULL AUTO_INCREMENT,
-- addr varchar(30) DEFAULT NULL,
-- user_id int(11) DEFAULT NULL,
-- PRIMARY KEY (id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- INSERT INTO user(name)
-- VALUES ("jin"),
-- ("po"),
-- ("alice"),
-- ("petter")

-- INSERT INTO addr(addr, user_id)
-- VALUES ("seoul", 1),
-- ("pusan", 2),
-- ("deajeon", 3),
-- ("deagu", 5),
-- ("seoul", 6)

-- CREATE TABLE user (
-- user_id int(11) unsigned NOT NULL AUTO_INCREMENT,
-- name varchar(30) DEFAULT NULL,
-- PRIMARY KEY (user_id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- CREATE TABLE addr (
-- id int(11) unsigned NOT NULL AUTO_INCREMENT,
-- addr varchar(30) DEFAULT NULL,
-- user_id int(11) DEFAULT NULL,
-- PRIMARY KEY (id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- INSERT INTO user(name)
-- VALUES ("jin"),
-- ("po"),
-- ("alice"),
-- ("petter")

-- INSERT INTO addr(addr, user_id)
-- VALUES ("seoul", 1),
-- ("pusan", 2),
-- ("deajeon", 3),
-- ("deagu", 5),
-- ("seoul", 6)

-- join
-- select *
-- from user
-- join addr
-- on user.user_id = addr.user_id

-- select user.name, addr.addr
-- from user
-- join addr
-- on user.user_id = addr.user_id

-- select user.name, addr.addr
-- from user
-- left join addr
-- on user.user_id = addr.user_id

-- select user.name, addr.addr
-- from user
-- right join addr
-- on user.user_id = addr.user_id

-- union - 하나로 합쳐지고, 중복제거도 됨
-- select name
-- from user
-- union
-- select addr
-- from addr

-- select name
-- from user
-- union all -- 중복된 결과 데이터
-- select addr
-- from addr

# full-outer join
-- select user.name, addr.addr
-- from user
-- left join addr
-- on user.user_id = addr.user_id
-- union
-- select user.name, addr.addr
-- from user
-- right join addr
-- on user.user_id = addr.user_id

# sub-query - query문 안에 있는 query : select, from, where
# 전체 나라 수, 전체 도시 수, 전체 언어 수
-- select
-- (select count(*) from country) as total_country,
-- (select count(*) from city) as total_city,
-- (select count(distinct(language)) from countrylanguage) as total_language

# 800만 이사이 되는 도시의 국가코드, 이름, 도시인구수를 출력
# countrycode를 key 값으로 사용해서 같은 countrycode 가진 애들 출력
-- select city.countrycode, city.name, country.name, city.population
-- from(
-- select countrycode, name, population
-- from city
-- where population > 8000000
-- ) as city
-- join country
-- on city.countrycode = country.code

# 800만 이상 도시의 국가코드, 국가 이름, 대통령 이름을 출력
-- select code, name, HeadofState
-- from country
-- where code in(
-- select countrycode from city where population>8000000
-- )

# index
-- explain -- key랑 Extra를 봐야 함. index 사용하면 Extra에 index 사용한다고 뜸. 33.33%만 filtered 됨
-- select*
-- from salaries
-- where salary>60000
-- limit 1000

-- select*
-- from salaries
-- where salary>60000
-- order by salary desc

-- create index salaries
-- on salaries(salary)

-- explain
-- select*
-- from salaries
-- where salary>60000
-- order by salary desc
-- limit 1000

-- drop index salaries

# salaries index 만들고 다시 이거 해 보면 빨라짐
-- explain
-- select*
-- from salaries
-- where salary>60000
-- order by salary desc
-- limit 1000

# view
-- create view country_city as
-- select countrycode, country.name as country_name, city.name as city_name
-- from country
-- join city
-- on country.code = city.countrycode

-- select *
-- from countrylanguage
-- join country_city
-- on countrylanguage.countrycode = country_city.countrycode

# join 할 때는 최대한 filtering 해서 데이터를 줄여놓고 join하는 게 성능이 훨씬 좋음