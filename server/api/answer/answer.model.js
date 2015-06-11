'use strict';

var crypto = require("crypto");

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Answer', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    hash: {
      type: DataTypes.STRING(30),
      allowNull: false
    },
    placeOfResidence: {
      type: DataTypes.STRING,
      allowNull: true
    },
    placeOfBirth: {
      type: DataTypes.STRING,
      allowNull: true
    },
    email: {
      type: DataTypes.STRING,
      allowNull: true,
      validate: {
        isEmail: true
      }
    },
    satisfaction: {
      type: DataTypes.INTEGER,
      allowNull: true,
      validate: {
        min: 0,
        max: 10
      }
    },
    token: {
      type: DataTypes.STRING(64),
      allowNull: true,
      set: function(value) {
        value = crypto.createHash("sha256").update(value || '').digest('hex');
        this.setDataValue('token', value);
      }
    }
  }, {
    // I don't want updatedAt
    updatedAt: false
  });
};
