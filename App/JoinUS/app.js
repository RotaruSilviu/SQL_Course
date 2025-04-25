var express =require('express');
var app = express();

var { faker } = require('@faker-js/faker');
var mysql = require('mysql2');

// login for mysql
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Daniela407#',
  database: 'join_us'
});


app.get("/", function(req, res){
    //console.log(req)
    res.send("WELCOME TO THE HOME PAGE!")
});

app.get("/joke", function(req, res){
    var joke = "What do you call a dog that does magic tricks? A labracadabrador";
    console.log("REQUESTED THE JOKE ROUTE!")
    res.send(joke);
});

app.get("/random_num", function(req, res){
    console.log("Got random number")
    var num = Math.floor((Math.random() * 10) + 1);
    res.send("Your lucky number is: " + num);
});

app.listen(8080, function(){
    console.log("Server running on 8080");
});








