#1
-- select Name, Population
-- from country
-- where population > 98881000
-- order by population desc

#2
-- select country.Name, city.count
-- from (select countrycode, count(name) as count
-- from city
-- group by countrycode) as city
-- join country
-- on city.countrycode = country.Code
-- order by city.count desc
-- limit 10

#3
-- select countrylanguage.Language, sum(round(countrylanguage.Percentage/100*country.population)) as count
-- from countrylanguage
-- join country
-- on countrylanguage.Countrycode = country.code
-- group by countrylanguage.Language
-- order by count desc
-- limit 10

#4
-- select city.Name, city.CountryCode, country.name, round(city.population/country.population*100,2) as percentage
-- from city
-- join country
-- on city.countrycode = country.code
-- where city.population > 5000000
-- having percentage >= 10
-- order by percentage desc

#5
-- select country.code, country.name, round(country.Population/country.SurfaceArea) as density
-- from country
-- where surfacearea >= 10000
-- order by density desc

-- select country.name, count(countrylanguage.Language) as language_count
-- from (select country.code, country.name, round(country.Population/country.SurfaceArea) as density
-- from country
-- where surfacearea >= 10000
-- having density >= 200
-- order by density desc) as country
-- join countrylanguage
-- on countrylanguage.countrycode = country.code
-- group by name
-- having language_count >= 5
-- order by language_count desc

#6.
select city.countrycode, city.name as city_name, city.population
from(select name, count(language) as language_count, 



