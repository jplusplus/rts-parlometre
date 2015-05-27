'use strict'

angular.module 'rtsDialectsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main.done',
    templateUrl: 'app/main/done/done.html'
    controller: 'MainDoneCtrl'
