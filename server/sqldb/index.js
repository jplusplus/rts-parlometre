/**
 * Sequelize initialization module
 */

'use strict';

var path = require('path');
var config = require('../config/environment');

var Sequelize = require('sequelize');

var db = {
  Sequelize: Sequelize,
  sequelize: new Sequelize(config.sequelize.uri, config.sequelize.options)
};


// Insert models below

/* The route Model is not yet activated
db.Route = db.sequelize.import(path.join(
  config.root,
  'server',
  'api',
  'route',
  'route.model'
)); */


module.exports = db;
