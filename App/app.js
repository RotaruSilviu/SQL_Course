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

var { faker } = require('@faker-js/faker');
var mysql = require('mysql2');

// login for mysql
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Daniela407#',
  database: 'join_us'
});

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

var q = 'SELECT count(*) as total from users';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results[0].total);
});
connection.end();
