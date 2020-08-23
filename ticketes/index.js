var express = require('express')
var http = require('http')
var path = require('path')
var bodyParser = require('body-parser')
var logger = require('morgan')
var mysql = require('mysql')
var mongoose = require('mongoose')
var cors = require('cors')
var fetch = require('fetch')

 
var app = express()

 

var publicDir = path.join(__dirname, '/');
console.log(publicDir);
app.use('/js', express.static('publicDir')); 
app.set('port', process.env.PORT || 3000)
app.use(logger('dev'))
app.use(bodyParser.json()) // Parses json, multi-part (file), url-encoded
app.use(cors())
 
app.get('/', function (req, res) {
  res.sendFile(path.join(publicDir, 'index.html'))
})



 

const batchFile =path.join(publicDir, 'batchprinter.bat');
console.log(batchFile);



function Process() {
  const process = require('child_process');   
  var ls = process.spawn('batchprinter.bat');
  ls.stdout.on('data', function (data) {
    console.log(data);
  });
  ls.stderr.on('data', function (data) {
    console.log(data);
  });
  ls.on('close', function (code) {
     if (code == 0)
          console.log('Stop');
     else
          console.log('Start');
  });
};



 async function generateFile(data){


  console.log(data);
  var fs = require("fs");
  
 
  
   fs.writeFile("estacion.txt", data, (err) => {
    Process(); 
    if (err) console.log(err);
    console.log("Successfully Written to File.");
  });
  
  }



app.post('/printer',  async (req, res)=> {

  console.clear();	
  console.log(req.body);
  console.log('imprimiendo');
  let dataFile=`\r\nE.D.S. SANTANA\r\nANSERCA\r\nCALDAS\r\nN.I.T. 00000000\r\nCel:312-760-3442\r\nVARIANTE CENTRAL\r\nVIA MEDELLIN\r\n\r\nVENTA DE COMBUSTIBLES\r\n\r\n`;
  console.log(dataFile);
  let fields="";
  let values="";
  let str="";
  Object.keys(req.body).forEach(key=>{
	 
	  console.log(req.body[key]);
	   
      if (req.body[key]!=="")
      dataFile+=`${key}:${req.body[key]}\r\n`;
      if ((key!="tabla")&&(key!="indice")){
      fields+=`${key},`;
      values+=`"${req.body[key]}",`;
	  }
  });
  res.send({'mensaje':'Listo'});
  
  fields=fields.substring(0,fields.length-1);
  values=values.substring(0,values.length-1);
  console.log(fields);
  console.log(values);
  
  
  
  dataFile+=`\r\n`;
  dataFile+=`\r\n`;
  dataFile+=`Gracias por su compra.\r\n`;
  dataFile+=`Vuelva Pronto.\r\n`;
  dataFile+=`\r\n`;
  dataFile+=`\r\n`;
  dataFile+=`\r\n`;
  dataFile+=`\r\n`;
  dataFile+=`\r\n`;
  dataFile+=`\r\n`; 
  await generateFile(dataFile);
  

  
});
 


var server = http.createServer(app);
 

server.listen(app.get('port'), function () {
  console.log('Web server listening on port ' + app.get('port'))
})


