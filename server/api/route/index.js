'use strict';

var express = require('express');
var controller = require('./route.controller');

var router = express.Router();

router.get('/:hash', controller.hash);

module.exports = router;
