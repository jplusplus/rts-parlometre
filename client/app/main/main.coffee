'use strict'

angular.module 'rtsDialectsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'
    resolve:
      cities: (Cities)-> Cities.get()
      questions: (Questions)-> Questions.get()
