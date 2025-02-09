SELECT *  from books;

-- Comanda concat v a concatena orice este introdus intre paranteze, concat este o functie.
SELECT concat(author_fname, ' ' , author_lname) as "FULL Name"
	FROM books;
-- concat_ws (white space) va lua orice este introdus ca prima valoare si il va adauga intre toate valorile care urmeaza.
SELECT concat_ws('-', author_fname, author_lname ) from books;

-- SUBSTRING sau substr
-- In acest mod se introduc indexurile (2 valori) de unde si pana unde se scoate substringul.
-- in acest caz "hell".
SELECT substring('Hello World' , 1 , 4);
-- In acest mod se ontroduce doar o valoare, si aceasta este pentru punctul de start al stringului.
-- in acest caz 'world'.
SELECT substring('Hello World' , 7);

SELECT substring(title, 1, 15) 
	from books;
Select substr(author_fname ,1 , 1) as initial, author_lname from books;

-- putem folosii concat si substr impreuna, mai intai e concat si dupa aia in loc de valoare normala pt concat,
-- o sa punem substringul si ce rezulta el.
SELECT concat(substr(title,1 ,10), '...') AS Short_Title FROM books;

DESC books;

SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS Initials
FROM
    books;
    
-- REPLACE 
-- Inlocuieste diferite parti din string cu altceva
-- dar nu se modifica tabelul, doar la vedere se inlocuieste.
-- Ia ca input stringul cu pricina, ce se inlocuieste , cu ce se inlocuieste

SELECT REPLACE('Hello World', 'Hell', '@%&$');
SELECT replace(title, ' ', '_') from books;

-- REVERSE
SELECT reverse('chocken nuggets');
SELECT reverse(author_fname) from books;
SELECT 
    CONCAT(author_fname, REVERSE(author_fname))
FROM
    books;

-- CHAR_LENGTH

SELECT CHAR_LENGTH('hello world');
SELECT 
    CHAR_LENGTH(title) as len, title
FROM
    books;

-- UPPER SI LOWER

select upper('hello world');
select upper(title) from books;

-- Exercitiu /////////
SELECT concat(
	'I LOVE ', upper(title), ' !!!'
) from books;
-- ////////////////////

-- INSERT

select INSERT ('Hello Bobby', 6 , 0 , ' There');
select INSERT ('Hello Bobby', 6 , 4 , ' There');

-- Left si Right
-- afiseaza caracterele din stanga sau in dreapta in fucntie de valoarea adaugata.

select left('Hello World', 5);
select left(author_lname, 1 ) from books;

-- REPEAT
-- face exact ce se aude.
select repeat('Hello World', 3);

-- TRIM
-- taie spatiile libere in plus din fata si din spatele stringului dar nu si de la mijloc

select trim('   san antonio   ');
SELECT TRIM('  bar   ');

SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx');

SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');

SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz');

-- Exercitiu STRING FUNCTIONS /////////////////////////

SELECT reverse(upper('Why does my cat lookat me with such hatred?'));

select replace(title, ' ' , '->') AS title from books;

SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;

SELECT 
    CONCAT(UPPER(author_fname),
            ' ',
            UPPER(author_lname)) AS 'full name in caps'
FROM
    books;

select concat(title, ' was released in ', released_year) as blurb from books;

select title, char_length(title) as 'characther count' from books;

SELECT 
    CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;




