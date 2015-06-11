'use strict';

var express    = require('express');
var controller = require('./answer.controller');
var response   = require('../response');

var router = express.Router();

router.post('/', controller.create);
router.get('/fake/', response.cachedRaw(), controller.hash);

module.exports = router;
