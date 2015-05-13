'use strict';

angular
  .module 'rtsDialectsApp'
    .config (RestangularProvider)->
      RestangularProvider.setBaseUrl '/api'
      RestangularProvider.setRestangularFields id: "_id"
