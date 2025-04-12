-- create table users(
--     email VARCHAR(255) PRIMARY KEY,
--     created_at TIMESTAMP DEFAULT NOW()
-- );

-- insert into users(email) values
-- ("Katie34@yahoo.com"),("Tunde@gmail.com");

-- insert into users(email, created_at) VALUES
-- ('dusty@gmail.com', 'Wed Aug 21 2024 17:06:23 GMT+0300');

select * from users
order by created_at desc;
select version();
select now();

-- to run a file in vs code use the terminal and type "source name_of_the_file.sql" !!!!!!!!


-- EXERCISES ////////
select DATE_FORMAT(created_at, '%M %D %Y')  as earliest_date
from users
order by created_at
limit 1;

select * 
from users
ORDER BY created_at
limit 1;

select 
    MONTHNAME(created_at) as MONTH,
    count(*) as count
from users
group by MONTH
ORDER BY count desc;

select count(*) as yahoo_users
from users
where email like ('%@yahoo.com');


select 
    SUBSTRING_INDEX(email, '@', -1) as provider,
    count(*) as provider_count
from users
GROUP BY provider
order by provider_count desc;

SELECT 
    CASE 
        when email like ('%@yahoo.com') then 'yahoo'
        when email like ('%@gmail.com') then 'gmail'
        when email like ('%@hotmail.com') then 'hotmail'
        else 'other' 
    END as provider,
    count(*) as total_users
from users
GROUP BY provider
order by total_users desc;