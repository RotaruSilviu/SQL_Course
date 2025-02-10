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
