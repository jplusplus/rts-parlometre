'use strict'

angular
  .module 'rtsDialectsApp'
    .controller 'MainOutroCtrl', ($scope, $stateParams, $state, app, Sharer, Cities, result)->
      $scope.hash = $stateParams.hash
      # Create a sharer object
      $scope.sharer = new Sharer result
      # Cantons list
      $scope.cantons = _.reduce result.cantons, (result, value, code)->
        # Create a new object for each canton
        result.push code: code, value: value, label: code, demonym: code
        result
      # We have to transform the cantons object to a an array
      , []
      # Color scaling to colorize city's bar
      color = chroma.scale(app.map.colors).domain app.map.domain
      # Style of a city's bar
      $scope.barStyle = (value)->
        width: (value * 100) + '%'
        background: color(value)
