-- Agregate Functions

select count(*) 
from books; -- steluta din functia count inseamna toate randurile.ALTER

select count(author_fname)
from books; --  numara de fiecare data cand o valoare este in acea coloana si nu se numara null.
select count(distinct author_fname)
from books;
select count(distinct released_year)
from books;
select count(*)
from books
where title like '%the%'; -- numara cate titluri au the in titlu si afiseaza doar numarul lor, nu si titlurile cu count

--  GROUP BY  //////////
select author_lname
from books
group by author_lname; -- Grupeaza valorile distinctive.

select author_lname, count(*) AS books_written
from books
group by author_lname
order by books_written DESC;

select released_year, count(*)
from books
GROUP BY released_year
order by released_year;

select author_lname , count(*)
from books
group by author_lname;

-- MIN and MAX//////////////////

select  min(released_year)
from books;

select max(pages)
from books;

select min(author_lname) -- frunctioneaza si pentru string, va gasi cea mai mica valoare alfabetica. 
from books;

-- Titlu celei mai lungi carti:

select title, pages
from books
order by pages desc limit 1; -- aici ne limiteaza sa selkecteam doar o optiune, daca sunt mai multe randuri cu aceasi valoare nu se va afisa.

select * 
from books
where pages = (select max(pages)
				from books); -- acesta e un sequeries, am folosit un select in alt select deci e o subrutina a primului SELECT
							-- aici daca avem mai multe randuri cu o valoare maxima  se vor afisa toate

select title, released_year
from books
where released_year = (select min(released_year) 
						from books);

-- GROUP BY MULTIPLE COLUMNS ///////

select author_fname, author_lname 
from books;

select author_fname, author_lname 
from books
order by author_lname;


select author_lname, author_fname, count(*)
from books
GROUP BY author_lname, author_fname;
-- sau asa
select concat(author_fname, ' ' , author_lname) as Full_Name, count(*)
from books
GROUP BY Full_Name;

-- MIN and MAX with GROUP BY

select author_lname, author_fname, min(released_year) as first_book
from books
group by author_lname,author_fname
order by first_book;

select 
	author_lname,
	author_fname,
	count(*) AS boks_written, 
        max(released_year) AS latest_release, 
        min(released_year) AS earliest_release,
        max(pages) AS longest_page_count
from books
group by author_lname,author_fname;

-- SUM  //////////////////// 

SELECT 
    SUM(pages)
FROM
    books;

SELECT 
    author_fname, SUM(pages)
FROM
    books
GROUP BY author_fname;

-- AVG /////////

SELECT 
    AVG(released_year)
FROM
    books;

SELECT 
    AVG(pages)
FROM
    books;

SELECT 
    AVG(stock_quantity)
FROM
    books;

SELECT 
    released_year, AVG(stock_quantity), COUNT(*)
FROM
    books
GROUP BY released_year;

-- Practice, on my own.

SELECT 
    COUNT(*)
FROM
    books;

SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;

SELECT 
    SUM(stock_quantity)
FROM
    books;

SELECT 
    author_lname, author_fname, AVG(released_year)
FROM
    books
GROUP BY author_lname , author_fname;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);

SELECT 
    released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS ' avg pages'
FROM
    books
GROUP BY released_year
ORDER BY year ASC;


