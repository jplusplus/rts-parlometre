'use strict';

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Route', {
    _id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    }
  });
};
