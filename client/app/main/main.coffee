'use strict'

angular.module 'rtsDialectsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'
    resolve:
      questions: ($http)->
        $http
          .get 'assets/data/questions.json'
          .then (res)-> res.data
