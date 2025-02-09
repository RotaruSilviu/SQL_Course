
-- Cream un database:
create database pet_shop;
use pet_shop;

-- Create a table:
CREATE TABLE cats (
	name VARCHAR(100),
    age int
);
-- //////// Insert in tabel valori:
INSERT INTO cats (name, age)
	VALUES ("Jetson", 7);
insert into cats (name, age)
    VALUES ("Blue Steele", 5);
insert into cats (name, age)
    VALUES ("Beth", 2);
insert into cats (name, age)
	Values  ('Meatball', 5),
			("Turkey" , 1),
            ("Potato Face", 15);
    
-- //Din nou cream un tabel:
CREATE TABLE dogs
(
	name VARCHAR(50),
    breed varchar(50),
    age int
);
	

show tables;
show columns from cats;
desc cats;
-- Cum verificam daca am facut corect:
select * from cats;
select name, age from cats;

-- how to delete tables
DROP TABLE cats;

-- /////////////////////////
create database shop;
create table pastries (
	name varchar(50),
    quantity int
    );
desc pastries;
drop table pastries;
-- ////////////////////////////////////

-- Insert exercise: /////////
create table people (
	First_name varchar(20),
    Last_name varchar(20),
    age int);
    
insert into people ( First_name, Last_name, age)
	VALUES ("Tina", "Becher", 13);
    -- Insertii multiple:
insert into people ( First_name, Last_name, age)
	Values  ("Linda", "Belcher", 45),
			("Phillip", "Frond", 38),
            ("Calvin", "Fischoeder", 70);
select * from people;
-- exercise/////////

create table parinti(
	nume varchar(20),
    status_parental varchar(20),
    data_nasterii date);
insert into parinti(nume, status_parental, data_nasterii)
	values  ("Silviu Tiberiu", "tata", "1994-08-08"),
			("Daniela", "mama", "1997-10-31");
select * from parinti;

-- Functionalitatea lui NULL
-- se poate insera in unele tabele valori si unele nu iar in dreptul lor va aparea NULL
-- NULL inseamna nici o valoare, nu e zero sau altceva, inseamna ca nu este nici o valoare.

insert into cats (name)
	values ("Todd"); -- in felul acesta am adaugat doar numele fara varsta.
    
-- NOT NULL se foloseste cand vrem ca voloana din acel tabel sa nu fie niciodata goala
create table cats2(
	name varchar(50) NOT NULL, -- conditionam coloana sa nu aiba nici un spatiu liber, sa nu aiba NULL.
    age int NOT NULL);
insert into cats2 (name)
	VALUES("BILBO"); -- Aici nu functioneaza pentru ca am specificat la crearea tabelului ca e NOT NULL.

-- Cum adaugam in stringuri apostrof:
insert into cats2(name, age)
 values ('mario\'s pizza', 20); -- faptul ca am folosit \' inseamna ca a ingnorat acel apostrof si l a transformat in text.
 
 -- DEFAULT Values
 create table cats3 (
	name varchar(50) default 'mystery', -- conditionam coloana ca sa fie mereu gen in dreptul ei cu default.
    age int default 99
    );
-- putem folosii si NOT NULL si DEFAULT ca sa conditionam pt ca nu sunt la fel, doarcere 
-- putem seta NOT NULL  cand inseram in tabel deci not null nu il anuleaza pe default sau invers.


-- Primary Key este un identificator unic.
-- Primary key nu poate sa fie NULL  !!!!!!

create table unique_cats(
	cat_id int NOT NULL primary key,
    name varchar(50),
    age int);
desc unique_cats;

insert into unique_cats(cat_id, name, age)
	Values  (1, 'bingo', 2),
			(2,'bongo', 3),
            (3, 'bogo', 4),
            (999, 'mica', 5);
select * from unique_cats;
 
-- AUTO_INCREMENT  creste integerul cu 1.

create table unique_cats3(
	cat_id int  auto_increment,
    name varchar(50),
    age int,
    PRIMARY KEY(cat_id));
    
insert into unique_cats3(name, age)
	VALUE ('himor',22);
insert into unique_cats3(name, age)
	VALUE ('fima',22);

select * from unique_cats3;

--  EXERCITIU --------
CREATE DATABASE firm;

create table employees(
	id int auto_increment primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    middle_name varchar(50),
    age int not null,
    current_status varchar(50) not null default 'employed'
    );

insert into employees (first_name ,last_name, age)
	Values ('thomas','chickenman', 87);
    
select * from employees;
desc employees;
-- Exercitiu terminat..

create database examen;
use examen;

-- Crearea tabelului Clienti
CREATE TABLE Clienti (
    IdClient INT AUTO_INCREMENT PRIMARY KEY,
    Denumire VARCHAR(100) NOT NULL,
    Oras VARCHAR(100) NOT NULL
);

-- Crearea tabelului Vanzari
CREATE TABLE Vanzari (
    IdVanzare INT AUTO_INCREMENT PRIMARY KEY,
    Produs VARCHAR(100) NOT NULL,
    Categorie VARCHAR(100) NOT NULL,
    Cantitate INT NOT NULL,
    Pret DECIMAL(10, 2) NOT NULL,
    IdClient INT,
    FOREIGN KEY (IdClient) REFERENCES Clienti(IdClient) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Popularea tabelului Clienti
INSERT INTO Clienti (Denumire, Oras)
VALUES
('Client A', 'Bucuresti'),
('Client B', 'Cluj-Napoca'),
('Client C', 'Timisoara'),
('Client D', 'Iasi'),
('Client E', 'Constanta'),
('Client F', 'Brasov'),
('Client G', 'Oradea'),
('Client H', 'Sibiu'),
('Client I', 'Arad'),
('Client J', 'Ploiesti');

-- Popularea tabelului Vanzari
INSERT INTO Vanzari (Produs, Categorie, Cantitate, Pret, IdClient)
VALUES
-- Alimente
('Branza', 'Alimente', 10, 20.50, 1),
('Paine', 'Alimente', 5, 2.00, 2),
('Lapte', 'Alimente', 15, 5.50, 3),
('Carne', 'Alimente', 3, 50.00, 4),
('Oua', 'Alimente', 12, 0.90, 5),

-- Bauturi
('Vin', 'Bauturi', 8, 30.00, 6),
('Bere', 'Bauturi', 24, 4.50, 7),
('Apa minerala', 'Bauturi', 30, 2.20, 8),
('Suc natural', 'Bauturi', 10, 8.50, 9),
('Whisky', 'Bauturi', 2, 120.00, 10),

-- Alte produse
('Ciocolata', 'Dulciuri', 20, 6.00, 1),
('Inghetata', 'Dulciuri', 15, 7.50, 2),
('Cafea', 'Dulciuri', 8, 25.00, 3),
('Chipsuri', 'Snack-uri', 10, 4.50, 4),
('Biscuiti', 'Snack-uri', 12, 3.50, 5),

-- Repetari de produse
('Branza', 'Alimente', 5, 20.50, 6),
('Bere', 'Bauturi', 12, 4.50, 7),
('Apa minerala', 'Bauturi', 20, 2.20, 8),
('Ciocolata', 'Dulciuri', 10, 6.00, 9),
('Cafea', 'Dulciuri', 5, 25.00, 10),

-- Diverse
('Pizza', 'Fast-food', 2, 30.00, 1),
('Hamburger', 'Fast-food', 5, 15.00, 2),
('Salata', 'Alimente', 3, 12.50, 3),
('Suc acidulat', 'Bauturi', 20, 5.00, 4),
('Croissant', 'Dulciuri', 10, 3.00, 5);

select * from vanzari;

SELECT 
    produs, SUM(cantitate)
FROM
    vanzari
GROUP BY produs;

select produs, categorie, min(pret) as 'cel mai mic pret'
from vanzari
group by categorie, produs;

select vanzari.produs, clienti.denumire as 'Client', clienti.oras
from vanzari
inner join clienti
on vanzari.idclient = clienti.idclient;


select count(Produs), IdClient
from Vanzari















