-- Constraints and Alter table
-- UNIQUE 

create table contacts (
	name varchar(100) not null,
    phone varchar(15) not null unique
);

insert into contacts( name, phone) 
values
	('billybob', '8766187636');

select * from contacts;

insert into contacts( name, phone) 
values
	('timmytimtim', '8766187636'); -- nu va functiona pentru ca nr de telefon nu este unicat
-- Deoarece la initializarea tabelului ampus ca atribut unique la nr de telefon , o alta intrare cu acelasi nr de telefon nu poate fi inserata.

-- CHECK constraint

create table users(
	username varchar(20) not null,
    age int check (age>0)
    );
    insert into users (username, age)
    values
		('bobitybob', 23);
   insert into users (username, age)
    values
		('Rotarus', -3); -- NU va functiona pt ca numarul introdus e 3 iar check nu ne lasa

create table palindromes (
	word varchar(100) CHECK(reverse(word) = word)
);
insert into palindromes(word) values ('racecar');
insert into palindromes(word) values ('mami');

-- How to customize the names of our constraints.

create table users2 (
	username varchar(20) not null,
    age int,
    CONSTRAINT age_positive check (age>= 0) -- asa adaugam nume la constraint
    );

insert into users2 (username, age)
values
	('chickenlady', -9);

-- Multiple constraints

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_adress UNIQUE (name , address)
);

insert into companies (name, address)
values ('blackbird auto', '123 spruce');
insert into companies (name, address)
values ('luigi s pie', '123 spruce');


create table houses(
	purchase_price int not null,
    sale_price int not null,
    CONSTRAINT sp_gt_pp check(sale_price >= purchase_price)
    );
    
insert INTO houses (purchase_price, sale_price)
values(100,200);
insert INTO houses (purchase_price, sale_price)
values(300,200);

-- ALTER TABLE









