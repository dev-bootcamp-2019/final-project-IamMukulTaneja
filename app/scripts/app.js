const ipfsHttpClient = require("ipfs-http-client");
const express = require("express");
const fs = require("fs");

const app =express();


const ipfs = ipfsHttpClient("ipfs.infura.io", "5001", {protocol: "https"});

let testFile = fs.readFileSync("../scripts/index.js");

let testBuffer = new Buffer(testFile);

var hash;

app.get("/addFile", function(req,res){

    res.render("University.ejs");
    // ipfs.add(testBuffer, function(err, file){
    //     if(err)
    //     {
    //         console.log(err);
    //     }
    //     else{
    //         console.log(file);
    //         hash = file[0].path;
    //         console.log(hash);
    //     }
    // })
    
});

app.get('/getfile', function(req, res) {

    ipfs.get(hash, function (err, files) {
        files.forEach((file) => {
          console.log(file.path)
          console.log(file.content.toString('utf8'))
        })
      })

})

app.listen(3000, () => console.log('App listening on port 3000!'))

