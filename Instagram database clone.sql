-- Instagram database clone

create database instagram_clone;
use instagram_clone;

-- Users Table
CREATE table users(
	id int AUTO_INCREMENT primary key,
    username varchar(255) unique not null,
    created_at timestamp default now()
);

describe users;
insert into users(username) values('BlueTheCat'), ('CharlieBrown'),('RotaruSilviu');
select * from users;


-- Photos Table
create table photos(
	id int AUTO_INCREMENT primary key,
    image_url varchar(255) not null,
    user_id INT not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id)
);

show tables;
desc photos;

insert into photos (image_url, user_id) values
('adsdawwca', 1),
('fsfbtndfsgfsdb', 2),
('anfndfynnymumumum', 2);

select * from photos;

select username, users.id, user_id, image_url, photos.created_at
from photos
join users ON users.id = photos.user_id;

-- Comments table

create table comments(
	id int AUTO_INCREMENT primary key,
    comment_text VARCHAR(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
	FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) references photos(id)
);
 desc comments;

insert into comments(comment_text, user_id, photo_id) values
('Meow!', 1, 2),
('Amazing shot', 3, 2),
('I love this', 2, 1);

select * from comments;

-- Likes Table

CREATE table likes(
	user_id int not  null,
    photo_id int not null,
    created_at timestamp DEFAULT now(),
    FOREIGN KEY (user_id) references users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY (user_id, photo_id)
);
desc likes;

insert into likes( user_id, photo_id) values
(1, 1),
(2,1),
(1,2),
(1,3),
(3,3);

--  nu v a functiona deoarece la creareatabelului a fost initializat constrangerea ca primary key sa fie o combinatie intre user si photo id;
insert into likes( user_id, photo_id) values
(1, 1);

-- Folows table

create table follows(
	follower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
    FOREIGN KEY (follower_id) references users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
); 

desc follows;

insert into follows( follower_id, followee_id) values
(1, 2),
(1, 3),
(3, 1),
(2, 3);

SELECT * from follows;
-- nu va  functiona pt ca e duplicat din cauza la primary key constraint
insert into follows( follower_id, followee_id) values
(1, 2);
-- aici v a functiona pt ca desii sunt aceleasi valori acestea sunt inversate deci nu violeaza primary key constraint;
insert into follows( follower_id, followee_id) values
(2, 1);






