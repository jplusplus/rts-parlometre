'use strict'

angular.module 'rtsDialectsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main.about',
    url: 'about'
    templateUrl: 'app/main/about/about.html'
