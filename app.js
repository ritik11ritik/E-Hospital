var express=require('express');
var session=require('express-session');

var app=express();
var db=require('./database');
var bodyParser=require('body-parser');
const multer=require('multer');

app.set("view engine","ejs");
app.use(express.static(__dirname + "/public/"));
app.use(session({secret:'$$$$RRRTTY829892$$$8',resave:false,saveUninitialized:true,cookie:{secret:true}}));
app.use(bodyParser.urlencoded({extended:true}));
// app.use(fileUpload());

var storage=multer.diskStorage({
	destination:(req,file,cb)=>{
		cb(null,'public/uploads')
	}
});

var upload=multer({storage:storage});

app.get("/",function(req,res){
	res.render("home");
});



// app.get("/doctor/register",function(req,res){
// 	res.render("doctor/register.ejs");
// });


var doc_register=require('./routes/doctor/register');
app.use('/doctor/register',doc_register);

app.get("/patient/register",function(req,res){
	res.render("patient/register.ejs");
});

app.post("/patient/register",function(req,res){
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
