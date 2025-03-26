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








































