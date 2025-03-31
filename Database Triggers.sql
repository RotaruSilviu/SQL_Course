-- Database triggers
create DATABASE triggers;
use triggers;
create table users(
	username varchar(100),
    age INT
);

insert into users (username, age) values
('Freddy', 25);

select * from users;

DELIMITER $$

CREATE TRIGGER must_be_adult
	before insert on users for each row
	begin
		if new.age < 18
        then
			signal sqlstate '45000'
					set message_text = 'Must be an adult';
		end if;
	end;


DELIMITER $$


insert into users (username, age) values
('Mercury', 20);
insert into users (username, age) values
('John', 14);


-- Explicatie unui trigger;


DELIMITER $$

CREATE TRIGGER must_be_adult
	before insert on users for each row
    -- Trigger time     event     and   table
    --   before         insert          users
	begin
		if new.age < 18
        then
			signal sqlstate '45000'
					set message_text = 'Must be an adult';
		end if;
	end;
$$

DELIMITER  ;

select * from users;


-- Triggers using  IG data

show tables;

insert into follows (follower_id, followee_id) values(4 ,4);


DELIMITER $$

CREATE TRIGGER prevent_self_follows
	before insert on follows for each row
	begin
		if new.follower_id = new.followee_id
        then
			signal sqlstate '45000'
					set message_text = 'You cannot follow yourself';
		end if;
	end;
$$

DELIMITER ;
insert into follows (follower_id, followee_id) values(5 ,5);


-- Keeping records of unfollows using Triggers.
create table unfollows(
	follower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
    FOREIGN KEY (follower_id) references users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
); 


DELIMITER $$

CREATE TRIGGER capture_unfollow
	after delete on follows for each row
	begin
		INSERT into unfollows(follower_id, followee_id)
        VALUES (old.follower_id, old.followee_id);
        -- sau se mai poate scrie asa:
        /* 
        insert into unfollows
        set
		follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
        */
	end;
$$

DELIMITER ;

delete from follows where follower_id = 2 and followee_id =1;

select * from unfollows;


-- MANAGING TRIGGERS:

show triggers;

-- removing triggers

drop trigger prevent_self_follows;







