-- Working with lots of IG data;

-- IG challenge nr 1
-- Show 5 oldest registered users:
 select *
 from users
 ORDER BY created_at limit 5;
 
-- ig challange #2;
-- What day of the week do most users register on:

select * from users;
select 
	dayname(created_at) as "Day of week",
	count(*) as "# of registered users"
from users
group by dayname(created_at) 
order by "# of registered users" desc limit 2;

-- ig challange #3:
-- Find users who have never posted a photo:

select user_id, users.id, username
from photos
right join users on users.id = user_id
WHERE photos.id is null; -- is null arata randul care are null si nu are nici o valoare;

-- ig challenge #4;
-- who has the most likes on a photo;

select * from likes;

/*select 
	username,
	count(*) AS likes
from users
join likes on likes.user_id = users.id
join photos on photos.user_id - users.id
group by username 
order by likes DESC;
*/
select 
	username,
	photos.image_url,
	count(*) AS likes
from likes
join photos on photos.id = likes.photo_id 
join users on users.id = photos.user_id
group by photos.id
order by likes DESC 
limit 1;

-- IG challenge #5
-- How many times does the average user post:

select *
from photos;


select 
    username,
    count(*)
from users
join photos on photos.user_id = users.id
group by username;

select 
	(select count(*) FROM photos) /
    (select count(*) from users) as average;

-- Ig challenge #6
-- What are trhe top 5 most commonly user hashtags

select * from tags;
select * from photo_tags;

select 
	tag_name,
	count(*) as most_used
from photo_tags
join tags on tags.id = photo_tags.tag_id
group by tag_id
order by most_used desc
limit 5;

-- IG challenge #7
-- Find users who have liked every single photo on the site:

select * from users;
select * from likes;
select * from photos;

select * 
from users
join likes on likes.user_id = users.id;

select 
	username,
    count(*) as total
from users
join likes on likes.user_id = users.id
GROUP BY username
having  total = (select count(*) from photos);


























