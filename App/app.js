// for (var i = 0; i < 500 ; i++){
//     console.log(i);
// }

// // for (var i = 0; i < 500 ; i++){
// //     // insert a new user into the databse
// // }


var { faker } = require('@faker-js/faker');

// faker.internet.email()
console.log(faker.internet.email(), faker.date.past())
console.log(faker.date.past().toString());

function generateAdress() {
    console.log(faker.location.streetAddress());
    console.log(faker.location.city());
    console.log(faker.location.state());
}

generateAdress()