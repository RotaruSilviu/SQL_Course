SELECT 
    *
FROM
    books;
desc books;

-- CHAR AND VARCHAR \\\\\\\\

CREATE TABLE friends (
    name VARCHAR(10)
);
insert into friends (name) values ('Tom'), ('Juan Pablo'), ('James');
SELECT 
    *
FROM
    friends;
 
CREATE TABLE states (
    abbr CHAR(2)
);
 insert into states (abbr) values ('CA'), ('NY');
SELECT 
    *
FROM
    STATES;
-- foloseste char doar daca fixed lenght things. cand stim ca ceva e de o marime fixa, nici mai mare nici mai mic. 
-- Varchar la totul altceva, singura diferenta intre ele este marimea de bytes, dar asta o sa fie mai importante la table si sheme mai mari.ALTER
 desc states;
 insert into states (abbr) values ('x');
SELECT 
    CHAR_LENGTH(abbr)
FROM
    states;
insert into states (abbr) 
values ('Ohio'); --  Nu v a functiona pentru ca e mai lung de doua caractere
insert into friends (name) 
values ('Luke Skywalker');-- din nou nu v a functiona pentru ca e mai lung de 10 caractere desii e varchar.

CREATE TABLE parents (
    children TINYINT UNSIGNED
); -- folosim ''unsigned'' ca sa se adauge numai valori pozitive,
insert into parents(children)
values (2), (4), (0);
SELECT 
    *
FROM
    parents;
insert into parents (children)
values (200); -- nu v a functiona pentru ca trece de 127 pentru ca folosim tinyint.

-- DECIMAL
 
 
