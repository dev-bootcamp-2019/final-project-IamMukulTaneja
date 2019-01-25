var express = require("express");
var bodyParser = require("body-parser");
var app = express();
var contractInteraction = require("./ContractInteraction");

// var student = require("./routes/Student");
// var university = require("./routes/University");
// var verifier = require("./routes/Verifier");


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
// app.use(student);
// app.use(university);
// app.use(verifier);

app.set("view engine", "ejs");

app.get("/",function(req,res){

    res.render("index");

});

app.post("/awardDegree",function(req,res){
    var value = contractInteraction.App.awardDegree(req.body.EnrollNum, req.body.IpfsHash, req.body.Shahash);
    console.log(value);

})

// app.post("/",function(req, res){
//     var designation = req.body.designation;
//     var username = req.body.username;
//     var password = req.body.password;

//     if(designation == "university")
//     {
//         if(username == "university" && password == "password1")
//         {
//             res.redirect("/university");
//         }
//         else{
//             res.redirect("/");
//         }
//     }
//     else if(designation == "student")
//     {
//         if(username == "student" && password == "password2")
//         {
//             res.render();
//         }
//         else{
//             res.redirect("/");
//         }
//     }
//     else
//     {
//         if(username == "verifier" && password == "password3")
//         {
//             res.render();
//         }
//         else{
//             res.redirect("/");
//         }
//     }
// });









app.listen("3000",function(){
    console.log("The app has started on port 3000");
})