//var express = require('express');
module.exports = function(app){
var express = require('express');
  app.use(express.static(__dirname + '/.static'));
}
