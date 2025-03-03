-- COMPARISON AND LOGICAL OPERATORS

-- NOT EQUAL

select title from books where released_year != 2017;

select title , author_lname from books where author_lname != 'Gaiman';

-- NOT LIKE

select title from books where title NOT LIKE '% %';

select title, author_fname, author_lname from books
	where author_fname  NOT LIKE '%da%';
select title from books where title not like '%a%';

-- GREATER THAN

SELECT * from books where released_year > 2000;

select * from books where pages  > 500;

select 80 > 40; -- o sa rezulte 1 adica ca e adevarat, daca expresia ar fi gresita ar fi 0 adica negativ.

select title, pages, released_year  
from books
where pages > 500;

select 1 > null;

-- LESS THAN or EQUAL

select title , released_year
from books
where released_year < 2000
order by released_year;

select title, pages
from books
where pages < 200;

select  title, released_year
from books
where released_year >= 2010
order by released_year;

-- LOGICAL AND &&

SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'Eggers'
        AND released_year > 2010;

SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'Eggers'
        AND released_year > 2010
        AND title LIKE '%novel%';

SELECT 
    title, pages
FROM
    books
WHERE
    CHAR_LENGTH(title) >= 30 AND pages > 500;

-- LOGICAL OR

SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname = 'Eggers'
        OR released_year > 2010;

select title, pages
from books
where 
		pages < 200 
		or title like '%stories%';

-- BETWEEN

select title, released_year 
from books
where released_year >=2004 and released_year <= 2015;

select title, released_year
from books
where released_year between 2004 and 2014; -- Between este inclusiv, deci include si valorile care sunt prezentate

select title, pages
from books
where pages between 200 and 300; 

select title, released_year
from books
where released_year not between 2004 and 2014;

-- COMPARING DATES:

SELECT 
    *
FROM
    people;

SELECT name, birthdate
from people
where birthdate < '2005-01-01';

select name, birthdate
from people
where year(birthdate) < 2005;

select name, birthtime
from people
where hour(birthtime) > 9;

-- CAST

select cast('09:00:00' as time); -- transforma un string in alt tip de date, cum ar fii aici in time.ALTER

select *
from people 
where birthtime between cast('12:00:00' as time) and cast('23:00:00' as time);

select  *
from people
where hour(birthtime) between 12 and 22;

-- THE IN OPERATOR





