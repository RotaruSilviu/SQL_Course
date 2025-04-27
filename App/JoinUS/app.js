var express =require('express');
var app = express();
var bodyParser = require("body-parser");

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
//Foloseste  app.css ca stylesheet
app.use(express.static(__dirname + "/public"));

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
    var q = 'SELECT count(*) as count from users';
    connection.query(q, function (error, results, fields) {
      if (error) throw error;
       var count = results[0].count
      console.log(count);
      //res.send("We have " + count + " users in our database.")
      res.render("home",{count: count});
    });
    
});

app.post("/register", function(req, res){
  //var email = req.body.email;
  var person = {
        email: req.body.email
     };
    connection.query('insert into users set ?', person, function(err, result){
      if (err) throw err;
      res.redirect("/")
      //res.send("Thanks for joining our wait list!")
    });

  //console.log("You pressed the button! And email is: " + req.body.email)
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








