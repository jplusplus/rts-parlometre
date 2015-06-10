'use strict'

angular.module 'rtsDialectsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main.outro',
    url: '{hash:[0-9a-fA-F]{1,25}}'
    templateUrl: 'app/main/outro/outro.html'
    controller: 'MainOutroCtrl'
    resolve:
      result: (Questions, $stateParams)->
        Questions.result $stateParams.hash
