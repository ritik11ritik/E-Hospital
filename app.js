var express=require("express");
var app=express();

app.set("view engine","ejs");
app.use(express.static(__dirname + "/public"));

app.get("/",function(req,res){
	res.render("home");
});

app.get("/doctor/register",function(req,res){
	res.render("doctor/register.ejs");
});

app.get("/patient/register",function(req,res){
	res.render("patient/register.ejs");
});

app.post("/patient/register",function(req,res){
	res.send("register-form");
});

app.post("/doctor/register",function(req,res){
	res.send("register-form");
});

app.get("/doctor/login",function(req,res){
	res.render("doctor/login.ejs");
});

app.get("/patient/login",function(req,res){
	res.render("patient/login.ejs");
});

app.post("/patient/login",function(req,res){
	res.send("register-form");
});

app.post("/doctor/login",function(req,res){
	res.send("register-form");
});

app.listen(3000,function(){
	console.log("server has started!!");
});
