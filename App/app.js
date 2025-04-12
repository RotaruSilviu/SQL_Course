// for (var i = 0; i < 500 ; i++){
//     console.log(i);
// }

// // for (var i = 0; i < 500 ; i++){
// //     // insert a new user into the databse
// // }
// faker.internet.email()
// console.log(faker.internet.email(), faker.date.past())
// console.log(faker.date.past().toString());

// function generateAdress() {
//     console.log(faker.location.streetAddress());
//     console.log(faker.location.city());
//     console.log(faker.location.state());
// }

// generateAdress()


// npm install @faker-js/faker
// npm install mysql2
//mysql -u root -p
//mysql -u root -p
// control c : ca sa iesi din prompt cand se blocheaza terminalul


// var q = 'select curtime() as time, curdate() as date, now() as now';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].time);
//   console.log(results[0].date);
//   console.log(results[0].now);
// });

// connection.end(); // casa nu se blocheze terminalul

//   console.log(results[0].time);
//   console.log(results[0].date.toString());
//   console.log(results[0].now.toString());


// var q = 'SELECT * from users';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[1].email);
// });
// connection.end();

// SELECTING DATA////////////////////////

// var q = 'SELECT count(*) as total from users';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].total);
// });
// connection.end();

// INSERTING DATA:///////////////////////////

// var q = 'insert into users(email) values ("rusty_the_dog@gmail.com")';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });
// connection.end();

// INSERTING DATA 2 WITH FAKER//////////////////////////////

// var person = {
//     email: faker.internet.email(),
//     created_at: faker.date.past()
//  };

//  console.log(person);
// var end_result = connection.query('insert into users set ?', person, function(err, result){
//   if (err) throw err;
//   console.log(result);
// });

// console.log(end_result.sql);
// connection.end();

// console.log(faker.date.);


// INSERTING LOTS OF DATA////////////////////////////////////////////////////////

// var data = [];
// for (var i = 0; i < 500; i++){
//   data.push([
//     faker.internet.email(),
//     faker.date.past()
//     ]);
// }

// // console.log(data);

// var q = 'INSERT INTO users (email,created_at) VALUES ?';

// connection.query(q, [data], function(err, result) {
//     console.log(err);
//     console.log(result);
// });

// connection.end();

// CLEAN CODE FOR INSERTING 500 USERS IN BULK

var { faker } = require('@faker-js/faker');
var mysql = require('mysql2');

// login for mysql
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Daniela407#',
  database: 'join_us'
});


var data = [];
for (var i = 0; i < 500; i++){
  data.push([
    faker.internet.email(),
    faker.date.past()
    ]);
}

var q = 'INSERT INTO users (email,created_at) VALUES ?';
connection.query(q, [data], function(err, result) {
    console.log(err);
    console.log(result);
});

connection.end();






