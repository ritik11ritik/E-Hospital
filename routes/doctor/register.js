var express=require('express');
var bodyParser=require('body-parser');

const bcrypt=require('bcrypt');
const saltRounds = 10;
var db=require('../../database');
var multer=require('multer');



var router=express.Router();

router.use(bodyParser.urlencoded({extended:true}));


router.get("/",function(req,res){
    var sql='SELECT category from specialisation;';
    db.query(sql,(err,data)=>{
        if(err)
        res.send('ERROR 404!');
        res.render("doctor/register.ejs",{data:data});
  });
});


// Profile pic will be inserted in "public/profile_pic" as "[doctor's mobile number].jpg"  similarly id_proof image will be inserted in id_proof's folder with same name


router.post("/",(req, res) => {
  var cnt=0;
  var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    if(cnt==0)
    cb(null, ('public/profile_pic') )
    else 
    cb(null, ('public/id_proof') )
  },
  filename: function (req, file, cb) {
    cb(null, req.body.mobile+'.jpg')
    cnt++;
  }
  })

  var fileFilter= (req,res,cb)=>{
    let sql='SELECT COUNT(*) AS prev FROM doctor WHERE mobile="'+req.body.mobile+'";';
    console.log('12344343');
    db.query(sql,function(err,data){
        if(err)throw err;
        if(data[0].prev!=0)
        {
            cb('User Already Exists');          // IF WE COME HERE THEN FILE WILL NOT BE UPLOADED AND ERROR WILL BE "USER ALREADY EXISTS"
        }
        else 
        cb(null,true);                         // OTHERWISE FILE WILL BE INSERTED
      });
  }


  var upload = multer({ storage:storage,fileFilter: fileFilter}).fields([{
  name: 'profile_pic', maxCount: 1
  }, {
  name: 'id_proof', maxCount: 1
  }])
  upload(req,res,function(err) {

  if(err) {
    res.send(err);            // ERROR WILL BE SHOWN AS USER ALREADY EXISTS
    return ;
  }
  else{
  bcrypt.hash(req.body.password, saltRounds, function(err, hash) {
    sql='INSERT INTO `e_hospital`.`doctor` (`mobile`, `name`, `age`, `password`, `license_no`, `experience`, `consultaion_fee`, `specialisaton`, `qualification`) VALUES ("'+req.body.mobile+'", "'+req.body.name+'", '+req.body.age+', "'+hash+'", "'+req.body.license+'", '+req.body.experience+', '+req.body.fee+', "'+req.body.specialisation+'", "'+req.body.qualification+'");';
    console.log(sql);
    db.query(sql,function(err,data){
        if(err)
        {
          res.send('UNEXPECTED ERROR OCCURED - (contact admin)')
        }
        console.log('inserted');
        res.send('DOCTOR INSERTED !!! ')
    });
  });
  }});
});


module.exports=router;