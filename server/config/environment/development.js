'use strict';

// Development specific configuration
// ==================================
module.exports = {
  sequelize: {
    uri: 'sqlite://',
    options: {
      logging: false,
      storage: 'dev.sqlite',
      define: {
        timestamps: false
      }
    }
  },
  seedDB: true
};
