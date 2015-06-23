'use strict'

angular
  .module 'rtsDialectsApp'
    .controller 'MainOutroCtrl', ($scope, $stateParams, $state, app, Sharer, Cities, result)->
      $scope.hash = $stateParams.hash
      # Create a sharer object
      $scope.sharer = new Sharer result
      # Change page title for facebook sharing
      $("meta[property='og:title'], meta[name='twitter:title']").attr "content", do $scope.sharer.title
      # Cantons list
      $scope.cantons = result.cantons
      # Color scaling to colorize city's bar
      color = chroma.scale(app.map.colors).domain app.map.domain
      # Style of a city's bar
      $scope.barStyle = (value)->
        width: (value * 100) + '%'
        background: color(value*15)
      # Restore page title
      $scope.$on '$stateChangeStart', (ev, next)->
        # Change page title
        $("title").html $("title").attr("ng-bind")
