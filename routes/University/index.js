var express = require("express");
var multer = require("multer");
var fenc = require("file-encryptor");
var crypto = require("crypto");
var fs = require("fs");
var ipfstalk = require("../ipfstalk");
var app = module.exports =  express();

var algorithm = 'sha256';
var shasum = crypto.createHash(algorithm);
var key = "payalisbad";
var options = {
    algorithm: "aes256"
}

var shaHash;
var ipfsHash;

const upload = multer({
    dest: 'degree/'
  }); 

app.get("/university", function(req, res){

    res.render("university/university");
      
});

app.post("/university/award",upload.single("Degree"), function(req, res){
    
    var enrollmentNumber = req.body.EnrollNum;
    var file = req.file;
    var filename = file.path;
    s = fs.ReadStream(filename)
    s.on('data', function(data) {
            shasum.update(data);
    });
    s.on('end', function() {
        var hash = shasum.digest('hex');
        shaHash =hash;
      });
   
    fenc.encryptFile(file.path,file.path,key,options,function(err)
    {
        console.log(err);
    });

    ipfsHash = ipfstalk.addIpfsFile(file.path);
    console.log(ipfsHash);




});