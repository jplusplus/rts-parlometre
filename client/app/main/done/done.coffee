'use strict'

angular.module 'rtsDialectsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main.done',
    url: 'done'
    templateUrl: 'app/main/done/done.html'
    controller: 'MainDoneCtrl'
