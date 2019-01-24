var qpdf = require('node-qpdf');

var options = {
    keyLength: 128,
    password: 'YOUR_PASSWORD_TO_ENCRYPT',
    restrictions: {
        print: 'low',
        useAes: 'y'
    }
}

qpdf.encrypt("./Cover.pdf", options, "./");