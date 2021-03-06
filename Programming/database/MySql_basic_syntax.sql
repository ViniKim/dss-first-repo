-- create database test;
-- use test;
-- show databases;
-- select database();
-- create table user1(
-- user_id int,
-- name varchar(20),
-- email varchar(30),
-- age int(3),
-- rdate date
-- );
-- create table user2(
--  user_id int primary key auto_increment,
--  name varchar(20) not null,
-- email varchar(30) unique not null,
-- age int(3) DEFAULT '30',
-- rdate timestamp
-- );
-- ALTER TABLE user1
-- ADD COLUMN deci DECIMAL(5,2)
-- database - 문자 인코딩 수정 할 수 있음
-- show variables like 'character_set_database';
-- alter database test character set = utf8
-- talbe(column) - add, modify, drop
-- alter table user2 add tmp TEXT;
-- alter table user2 modify column tmp int;
-- alter table user2 drop tmp;
-- create database tmp;
-- show databases;
-- drop database tmp;
-- create table tmp(id int);
-- drop table tmp;
-- insert
-- INSERT INTO user2(name, email)
-- VALUES ("jin", "pdj@gmail.com"),
-- ("peter", "peter@daum.net");
-- select
-- select name as "이름", email as "이메일"
-- from user1
-- select distinct(name)
-- from user1
-- select *
-- from user1
-- where age > 30
-- where rdate > "2017-01-01"
-- where rdate > "2017-01-01" and rdate < "2018-07-01"
-- where rdate > "2017-01-01" or rdate < "2018-07-01"
-- where rdate between "2017-01-01" and "2018-07-01"
-- where age = 30
-- where name = "jin"
-- order by age -- 원래 뒤에 asc 쓰는데 오름차순할땐 생략해도 갠춘
-- order by name desc
-- order by name desc
-- order by age desc, rdate
-- order by age desc, rdate desc
-- select - concat
-- select name, age, concat(name, "(",age,")")
-- from user1
-- select name, age, concat(name, "(",age,")") as name_age
-- from user1
-- select - like
-- select *
-- from user1
-- where email like "%@gmail%"
-- select *
-- from user1
-- where email not like "%@gmail%"
-- where email like "a%"
-- select - in
-- select *
-- from user1
-- where name in ("andy", "jin", "alice")
-- where name in (select name from user2 "andy", "jin")
-- select - limit
-- limit 3
-- limit 2,3 -- 세번째 데이터부터 뒤로 세 개
-- limit 2,4 -- 세번째 데이터부터 뒤로 네 개
-- order by user_id desc
-- limit 2,3
-- update
-- UPDATE user1
-- SET age=20, email="pdj@daum.net"
-- where name="jin"
-- limit 100

-- SELECT *
-- FROM user1
-- where name="jin"

-- delete
-- delete from user1
-- where rdte < "2016-01-01"

-- USE world
-- group by - count, min, max, sum, avg ..
-- select 'CountryCode', count(CountryCode)
-- from city
-- group by CountryCode 

-- select count(distinct(CountryCode))
-- from city

-- 대륙별로 인구수와 GNP 최소값과 최댓값을 조회
-- select continent, min(GNP), min(Poplulation)
-- from country
-- where GNP != 0 and Populatoin != 0
-- group by continent
-- select continent, max(GNP), max(Poplulation)
-- from country
-- where GNP != 0 and Populatoin != 0
-- group by continent

-- 대륙별로 총인구수와 총 GNP
-- select continent, sum(GNP), sum(Poplulation)
-- from country
-- where GNP != 0 and Populatoin != 0
-- group by continent
-- select continent, avg(GNP), avg(Poplulation) as Population
-- from country
-- where GNP != 0 and Populatoin != 0
-- group by continent
-- order by Population

-- gropy by - having
-- select Continent, sum(Population) as Population
-- from country
-- group by Continent
-- select Continent, sum(Population) as Population
-- from country
-- where Population > 500000000 -- 이거 한 다음에 groupby를 함
-- group by Continent
-- select Continent, sum(Population) as Population
-- from country
-- group by Continent
-- having Population > 500000000 -- gropuby까지 한 걸 조건줘서 출력함