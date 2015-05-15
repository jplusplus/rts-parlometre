'use strict'

angular
  .module 'rtsDialectsApp'
    .controller 'MainOutroCtrl', ($scope, $stateParams, app)->
      $scope.hash = $stateParams.hash
      # Fake cities list
      $scope.cities = [
        { label: 'Fribourg', value: Math.random() * 15 }
        { label: 'Valais',   value: Math.random() * 15 }
        { label: 'Genève',   value: Math.random() * 15 }
      ]
      # Color scaling to colorize city's bar
      color = chroma.scale(app.map.colors).domain app.map.domain
      # Style of a city's bar
      $scope.barStyle = (value)->
        width: (value/15 * 100) + '%'
        background: color(value)


