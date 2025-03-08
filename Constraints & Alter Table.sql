-- Constraints and Alter table
-- UNIQUE 

CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

insert into contacts( name, phone) 
values
	('billybob', '8766187636');

SELECT 
    *
FROM
    contacts;

insert into contacts( name, phone) 
values
	('timmytimtim', '8766187636');-- nu va functiona pentru ca nr de telefon nu este unicat
-- Deoarece la initializarea tabelului ampus ca atribut unique la nr de telefon , o alta intrare cu acelasi nr de telefon nu poate fi inserata.

CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);
    insert into users (username, age)
    values
		('bobitybob', 23);
   insert into users (username, age)
    values
		('Rotarus', -3);-- NU va functiona pt ca numarul introdus e 3 iar check nu ne lasa

CREATE TABLE palindromes (
    word VARCHAR(100) CHECK (REVERSE(word) = word)
);
insert into palindromes(word) values ('racecar');
insert into palindromes(word) values ('mami');

-- How to customize the names of our constraints.

CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_positive CHECK (age >= 0)
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


CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT sp_gt_pp CHECK (sale_price >= purchase_price)
);
    
insert INTO houses (purchase_price, sale_price)
values(100,200);
insert INTO houses (purchase_price, sale_price)
values(300,200);

-- ALTER TABLE
-- ne ajuta sa adaugam coloane la tabele deja existente

alter table companies
add column phone varchar(15);
SELECT 
    *
FROM
    companies;

alter table companies
add column employee_count int not null;

alter table companies
drop COLUMN phone;
desc companies;
alter table companies
drop column employee_count;

-- RENAME tables
show tables;
rename tables companies to suppliers;
alter TABLE suppliers
rename to companies;

-- RENAME colums

alter table companies
rename column name to company_name;

-- MODIFY columns

desc companies;

alter table companies
modify company_name varchar(100) default 'unknown';

SELECT 
    *
FROM
    houses;
desc houses;
alter table houses
add constraint positive_price check (purchase_price >= 0);
insert into houses (purchase_price, sale_price) values (-1, 4);
alter table houses drop constraint positive_price;