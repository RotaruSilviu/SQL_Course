SELECT 
    *
FROM
    books;
desc books;

-- CHAR AND VARCHAR \\\\\\\\

CREATE TABLE friends (
    name VARCHAR(10)
);
insert into friends (name) values ('Tom'), ('Juan Pablo'), ('James');
SELECT 
    *
FROM
    friends;
 
CREATE TABLE states (
    abbr CHAR(2)
);
 insert into states (abbr) values ('CA'), ('NY');
SELECT 
    *
FROM
    STATES;
-- foloseste char doar daca fixed lenght things. cand stim ca ceva e de o marime fixa, nici mai mare nici mai mic. 
-- Varchar la totul altceva, singura diferenta intre ele este marimea de bytes, dar asta o sa fie mai importante la table si sheme mai mari.ALTER
 desc states;
 insert into states (abbr) values ('x');
SELECT 
    CHAR_LENGTH(abbr)
FROM
    states;
insert into states (abbr) 
values ('Ohio'); --  Nu v a functiona pentru ca e mai lung de doua caractere
insert into friends (name) 
values ('Luke Skywalker');-- din nou nu v a functiona pentru ca e mai lung de 10 caractere desii e varchar.

CREATE TABLE parents (
    children TINYINT UNSIGNED
); -- folosim ''unsigned'' ca sa se adauge numai valori pozitive,
insert into parents(children)
values (2), (4), (0);
SELECT 
    *
FROM
    parents;
insert into parents (children)
values (200); -- nu v a functiona pentru ca trece de 127 pentru ca folosim tinyint.

-- DECIMAL
 
CREATE TABLE products (
    price DECIMAL(5 , 2 )
);
 insert into products (price) VALUEs( 4.50);
SELECT 
    *
FROM
    products;
 
 -- FLOAT and DOUBLE
 -- Float ocupa mai putin amemorie ca dpouble si este precis pana la 7 caractere. pe cand double pana la 15
 
 CREATE TABLE numbers (
    x FLOAT,
    y DOUBLE
);
 insert into numbers (x, y) values (1.123, 1.123);
SELECT 
    *
FROM
    numbers;
 insert into numbers (x, y) values (1.12345678, 1.12345678912345678);

-- DATES and TIME and DATETIME

CREATE TABLE people (
    name VARCHAR(50),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

insert into people( name, birthdate, birthtime, birthdt)
values ('Elton', '2000-12-25', '11:00:00', '200-12-25 11:00:00' );

 select * from people;

insert into people( name, birthdate, birthtime, birthdt)
values ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10' );

insert into people( name, birthdate, birthtime, birthdt)
values ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00' );

select curtime(), curdate(), now();

insert into people (name, birthdate, birthtime, birthdt)
values ('Hazel', curdate(), curtime(),now());

-- Date Functions.

 SELECT 
    birthdate
FROM
    people;
SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate),
    monthname(birthdate),
    dayname(birthdate)
FROM
    people;
    
SELECT 
    name,
    birthdt,
    YEAR(birthdt),
    MONTHNAME(birthdt),
    DAYNAME(birthdt)
FROM
    people;

SELECT 
    name,
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime),
    SECOND(birthtime)
FROM
    people;
    
SELECT 
    name, DATE(birthdt), TIME(birthdt)
FROM
    people;
    
-- How to get the month name, day name, and year
-- april 11 2025

select	concat(
	monthname(birthdt), 
    ' ',
    day(birthdt),
    ' ',
    year(birthdt)) as 'Date of birth'
from
	people;
-- sau se mai poate face in felul urmator
SELECT 
    birthdt,
    DATE_FORMAT(birthdt, '%b'),
    DATE_FORMAT(birthdt, '%a'),
    DATE_FORMAT(birthdt, '%a %b %e %D')
FROM
    people;
    
select
	name,
	birthdt,
    date_format(birthdt, '%H:%i')
from 
	people;

select 
	birthdate,
    birthdt,
	datediff(curdate(), birthdate) -- face diferenta intre doua dati, si afiseazain zile
from 
	people;

SELECT
    date_add(curdate(), interval 1 year),
    date_add(curdate(), interval 1 month),
    date_sub(curdate(), interval 1 year);

select
	birthdate,
    date_add(birthdate, interval 18 year)
from
	people;
    
select timediff(curtime(), '07:00:00');
	
select now() - interval 18 year;
select 
	name, 
    birthdate,
    birthdate + interval 21 year,
    year(birthdate + interval 21 year) as 'Legal drinking age'
from 
	people;

 
