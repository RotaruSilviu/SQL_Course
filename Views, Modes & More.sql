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


























	








