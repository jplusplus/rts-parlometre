'use strict';

var crypto = require("crypto"),
     cache = require('memory-cache');

module.exports.validationError = function(res, statusCode) {
  statusCode = statusCode || 422;
  return function(err) {
    res.jsonp(statusCode, err);
  };
};

module.exports.handleError = function(res, statusCode) {
  statusCode = statusCode || 500;
  return function(err) {
    res.send(statusCode, err);
  };
}

module.exports.respondWith = function(res, statusCode) {
  statusCode = statusCode || 200;
  return function() {
    res.send(statusCode);
  };
}

var setCachedRequest = module.exports.setCachedRequest = function(req, value, duration, prefix) {
  // Default cache's key prefix
  prefix = prefix || '';
  // Default duration of 2000 ms
  duration = duration || 2000;
  // Save the value
  cache.put(prefix + requestKey(req), value, duration);
};

var requestKey = module.exports.requestKey = function(req) {
  // Get request argument to create a unique hash object
  var hash = JSON.stringify([ req.baseUrl + "/" + req.path, req.params, req.query ]);
  // Create a cache key
  return "request_" + crypto.createHash("sha256").update(hash).digest('hex');
}

var cachedRequest = module.exports.cachedRequest = function(prefix) {
  // Default cache's key prefix
  prefix = prefix || '';
  return function(callback) {
    return function(req, res, next) {
      // Create a cache key
      var key = prefix + requestKey(req);
      // Proxy the real end function
      var value = cache.get(key);
      // A value already exists
      if( value ) {
        // Send the value as JSON
        callback(req, res, value);
      } else {
        // Continue
        next();
      }
    };
  };
};

var cachedJson = module.exports.cachedJson = function(prefix) {
  return cachedRequest(prefix)(function(req, res, value) {
    res.status(201).jsonp(value);
  });
};

var cachedRedirect = module.exports.cachedRedirect = function(prefix) {
  return cachedRequest(prefix)(function(req, res, value) {
    res.redirect(value);
  });
};

var cachedRaw = module.exports.cachedRaw = function(prefix) {
  return cachedRequest(prefix)(function(req, res, value) {
    res.send(value);
  });
};
