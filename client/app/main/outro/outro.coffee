'use strict'

angular.module 'rtsDialectsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main.outro',
    url: ':hash'
    templateUrl: 'app/main/outro/outro.html'
    controller: 'MainOutroCtrl'
