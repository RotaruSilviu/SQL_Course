-- Views, Modes & More
-- views ne permite sa rulam un query si sa o salvam si sa ii dam un nume si sa il utilizam ulterior;

select title, released_year, genre, rating, first_name,last_name 
from reviews
join series on series.id = reviews.series_id
join reviewers on reviewers.id = reviews.reviewer_id;

CREATE VIEW full_reviews AS
select title, released_year, genre, rating, first_name,last_name 
from reviews
join series on series.id = reviews.series_id
join reviewers on reviewers.id = reviews.reviewer_id;

show tables;
select * from full_reviews;

select genre, avg(rating) 
from full_reviews
group by genre;

delete from full_reviews WHERE released_yead = 2010; -- nu v asterge nimic doarece acesta este un "view';

create view ordered_series as
select * from series order by released_year;
select * from ordered_series;

insert into ordered_series ( title, released_year, genre)
values ('The Great', 2020, 'Comedy');

create or replace view ordered_series as
select * from series order by released_year desc;

alter view ordered_series as
select * from series order by released_year;

drop view ordered_series;

-- GROUP BY HAVING

select 
	title, 
    avg(rating),
    count(rating) as count_review
from full_reviews
group by title having count(rating) > 1;

-- GROUP BY ROLL UP

select title, avg(rating) 
from full_reviews
group by title with ROLLUP; 
-- are un rand in plus cu sumarul statisticilor, adica aici are un rand in plus cu avg tuturor review urilor.

select title, count(rating)
from full_reviews
group by title with ROLLUP;
-- acelasi lucru aici doar ca la final are numarul tuturor ratingurilor, hence count

select released_year,genre,  avg(rating)
from full_reviews
group by released_year, genre with ROLLUP;

-- SQl MODES

select @@GLobal.sql_mode;
select @@session.sql_mode;

set session sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';

-- Full group by

select title, avg(rating)
from series
join reviews on reviews.series_id = series.id
group by title;




	








