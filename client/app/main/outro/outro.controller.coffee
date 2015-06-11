'use strict'

angular
  .module 'rtsDialectsApp'
    .controller 'MainOutroCtrl', ($scope, $stateParams, $state, $fb, $twt, app, result)->
      $scope.hash = $stateParams.hash
      # Get the absolute URL of the current state
      $scope.url = $state.href 'main.outro', { hash: $scope.hash }, { absolute: yes }
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
      # Facebook's sharing
      $scope.fb = ->
        $fb.feed
          name: "Le Parlomètre romand - RTS"
          description: "Je parle français comme les habitants de Fribourg"
          link: $scope.url
          picture: app.sharing.url + "/assets/images/rts-red.jpg"
      # Twitter's sharing
      $scope.tw = ->
        $twt.intent 'tweet',
          text: 'Je parle français comme les habitants de Fribourg'
          url: $scope.url


