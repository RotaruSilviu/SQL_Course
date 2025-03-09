-- One to Many  & Joins

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
);
-- foreign key face referinta la customer id si mai ales trebuie sa exista sa putem insera un rand;
create database shop;
use shop;
show tables;
SELECT 
    *
FROM
    customers;
SELECT 
    *
FROM
    orders;

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

insert into orders (order_date, amount, customer_id)
values
	(curdate(), 50.68, 975);


drop table customers;
DROP table ordecustomersrs;

insert into orders (order_date, amount, customer_id)
values
	(curdate(), 78.99, 3);

-- CROSS JOINS

SELECT 
    id
FROM
    customers
WHERE
    last_name = 'George';
SELECT 
    *
FROM
    orders
WHERE
    customer_id = 1;

SELECT 
    *
FROM
    orders
WHERE
    customer_id = (SELECT 
            id
        FROM
            customers
        WHERE
            last_name = 'George');

SELECT 
    *
FROM
    customers,
    orders;-- acest lucru e inutil, cross join nu are nici un sens cum impreuneaza tabelele;

SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        JOIN
    orders ON customers.id = orders.customer_id;

SELECT 
    *
FROM
    orders
        JOIN
    customers ON customers.id = orders.customer_id;

/*select * from orders
join customers
	on customers.id = orders.id; --  asta e  inutil, nu are sens ce am cautat.
*/

SELECT 
    first_name, last_name, SUM(amount) AS Total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
ORDER BY Total;

-- LEFT JOIN

SELECT 
    *
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;
-- Left join o sa imbine toate intrarile din partea stanga adica primul tabel pe care il scriem cu
-- al doilea tabel chiar daca nu are nimic in concordanta, in ex de fata un client fara comanda;
-- Si in felulacesta e un mod de a afla care client nu a depus nici o comanda;

SELECT 
    first_name, last_name, IFNULL(SUM(amount), 0) AS total
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name;

-- Right join

SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id;

insert into orders ( amount, order_date) values ( 100, curdate());

-- ON DELETE CASCADE

DELETE FROM customers 
WHERE
    last_name = 'George';
-- obtinem o eroare deoarece  are foreign key
-- cand initializam o coloana trebuie sa adaugam on delete cascade si in felul acesta cand incercam sa stergem o coloana o sa se stearga automat si ce a din care foreign key;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
);

drop table orders;
drop table customers;

SELECT 
    *
FROM
    orders;
SELECT 
    *
FROM
    customers;

DELETE FROM customers 
WHERE
    last_name = 'Michael';

-- EXERCISE ///////////////////////

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);
CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (id)
);

    INSERT INTO students (first_name) VALUES 
    ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
     
    INSERT INTO papers (student_id, title, grade ) VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The Art of The Essay', 98),
    (4, 'Borges and Magical Realism', 89);
    
SELECT 
    first_name, title, grade
FROM
    students
        JOIN
    papers ON students.id = papers.student_id
ORDER BY grade DESC;
    
SELECT 
    first_name, title, grade
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id;
        
	SELECT 
    first_name,
    IFNULL(title, 'MISSING') AS title,
    IFNULL(grade, 0) AS grade
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id;
        
	SELECT 
    first_name, IFNULL(AVG(grade), 0) AS average
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

	SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;