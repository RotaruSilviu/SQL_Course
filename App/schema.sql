create table users(
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

insert into users(email) values
("Katie34@yahoo.com"),("Tunde@gmail.com");