const ipfsHttpClient = require("ipfs-http-client");
const express = require("express");
const fs = require("fs");

const app =express();


const ipfs = ipfsHttpClient("ipfs.infura.io", "5001", {protocol: "https"});

var hash;

function addIpfsFile(filePath){
let testFile = fs.readFileSync(filePath);
let testBuffer = new Buffer(testFile);
    ipfs.add(testBuffer, function(err, file){
        if(err)
        {
            console.log(err);
        }
        else{
            hash = file[0].path;
            return hash;
        }
    });
}

function getIpfsFile(ipfsHash)
{
    ipfs.get(ipfsHash, function (err, files) {
        files.forEach((file) => {
          console.log(file.path);
        })
      });
}

    
module.exports = {
    addIpfsFile: addIpfsFile,
    getIpfsFile: getIpfsFile
}

