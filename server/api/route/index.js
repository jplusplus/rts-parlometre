'use strict';

var express = require('express');
var controller = require('./route.controller');
var response = require('../response')

var router = express.Router();

router.get('/hash/:hash', response.cachedRaw(), controller.hash);
router.get('/answer/:question/:answer', response.cachedRaw(), controller.hash);


module.exports = router;
