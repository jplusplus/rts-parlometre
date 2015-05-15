'use strict';

// Returns a fake 10 000 route's hash
var fake = function() {
  var hash = "";
  for(var i=0; i<10000; i++) {
    hash += Math.round(Math.random()*15).toString(16).toUpperCase();
  }
  return hash;
};

// Will returns a string of hexadecimal number describing
// avery pixels of an image (one number, one pixel value)
// that match with the given route's hash
exports.hash = function(req, res) {
  res.send( fake() );
};
