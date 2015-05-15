'use strict';

var express = require('express');
var controller = require('./route.controller');

var router = express.Router();

router.get('/hash/:hash', controller.hash);
router.get('/answer/:question/:answer', controller.hash);


module.exports = router;
