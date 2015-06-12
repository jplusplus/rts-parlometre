'use strict'

angular
  .module 'rtsDialectsApp'
    .service 'Cities', (app, $http)->
      new class
        constructor: ->
          @promise = $http
            .get 'assets/data/cities.json'
            .then (res)=> @cities = res.data
        # Get cities using a promises
        get: => @promise
        # Get the raw values
        values: => @cities or []
        # Find a city by its code
        find: (code)=> _.find @values(), value: code
