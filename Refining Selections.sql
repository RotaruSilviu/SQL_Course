INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
    
-- DISTINCT ///////////////////////////////
select DISTINCT author_lname from books;
select distinct released_year from books;
-- distinct full name
select  distinct concat(author_fname, ' ' , author_lname) from books;
-- sau se poate face asa
select distinct author_fname, author_lname from books;
-- distinct face distinctia intre coloanele care le selectam , aici nume prenume si anul, deci toate coloanele pentru nici una nu seamana intre ele.
select DISTINCT author_fname, author_lname, released_year from books;

-- ORDER BY /////////////////////////////////////

SELECT 
    book_id, author_fname, author_lname
FROM
    books
order by author_lname desc; -- desc se foloseste daca vrem sa ordonam descrescator.
select title, pages from books order by pages;

select book_id, author_fname, author_lname, pages from books order by 4; -- daca scriem asa practic ordonam dupa coloana care e nuamrul respectiv, aici pages.

-- Al doilea order by grupeaza lista atunci cand sunt duplicate:
--  Daca un authorare mai multe opere , al doilea order by grupeaza dupa anul in care a fost scoasa cartea.
select author_lname, released_year, title from books order by author_lname, released_year;

select concat(author_fname, ' ', author_lname) as author from books order by author;
-- De cele mai multe ori , order by este folosit pentru a ordona alfabetic sau numeric.

-- LIMIT /////////////////////////////////////////

select book_id, title, released_year from books  order by released_year limit 5;
select book_id, title, released_year
from books
ORDER BY released_year
limit 0, 5;
-- ^ amandoua querys fac acelasi lucru , al doilea are doua valori introduse la limit care arata inceput si cate randuri sa mearga limita.
-- acestea ne ajuta sa alegem randuri din mijlocul tabelului

-- LIKE /////////////////////////////////////////

select author_fname
from books
where author_fname like '%da%'; -- % este un wildcard si inseamna 0 sau mai multe caractere.

select *
from books
where title like '%:%';

select *
from books
where author_fname like '_____'; -- '_' se foloseste cand stim cate caractere are stringul respectiv. daca sunt 5 caractere punem 5 _
-- sau daca vrem sa gasim un string cu ceva in mijloc '_a_' sau '%a__" sau '%n'
-- daca cautam un string cu % in el , trebuie sa folosim sintaxa \%
-- sau care are un underscore _ in el , folosim sintaxa \_
select *
from books
where title like '%\%%';


-- Exercise ///////////////////////

select title
from books
where title like '%stories%';

select title, pages
from books
order BY pages desc limit 1;

select concat(title, ' - ' , released_year) as summary
from books
order by released_year desc limit 3;

select title, author_lname
from books
where author_lname like '% %';

select title, released_year, stock_quantity
from books
ORDER BY  stock_quantity , title limit 3 ;

select title, author_lname
from books
order by author_lname, title;

select upper(concat('my favorite author is ', author_fname, ' ' , author_lname, '!')) as yell
from books
order by author_lname;