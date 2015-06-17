'use strict';

var request = require('superagent');

var sqldb    = require('../../sqldb');
var config   = require('../../config/environment');
var response = require("../response");

var Answer = sqldb.Answer;

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
  var pixels = fake();
  response.setCachedRequest(req, pixels, 24 * 60 * 60 * 10000);
  res.send(pixels);
};

// Save a user answer
exports.create = function(req, res) {
  // User's answer
  var answer = req.body;
  // The ip will be saved as a hash to detect flooding
  answer.token = req.ip;
  // Create the
  Answer.build(answer).save()
    .then(function(answer) {
      res.json(answer);
    })
    .catch(response.validationError(res));
}

// Proxy to get the hash result (IE9 doesn't support CORS)
exports.proxy = function(req, res) {
  var hash = req.query.hash;
  var url = config.resultsApi;

  request.get(url).query({ hash: hash }).end(function(err, result) {
    return res.json(result.body);
  });
};
