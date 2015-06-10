'use strict'

angular
  .module 'rtsDialectsApp'
    .service 'Questions', (app, $http, $rootScope, r)->
      new class
        constructor: ->
          @promise = $http
            .get 'assets/data/questions.json'
            .then (res)=>
              @questions = res.data.slice(0, 21)
              # Watch for chanhes on the question index
              $rootScope.$watch @index, ->
                # Broadcast the change
                $rootScope.$broadcast 'questions:index'
        # Get questions using a promises
        get: => @promise
        # Get the raw values
        values: => @questions or []
        # Generate a hash of answer using the user's answers.
        # The hash is made to match with R-generated map. With R, indexes
        # start at 1, not 0. So we add 1 to every answer's index.
        hash: => _.map( _.pluck(@values(), "userAnswer"), (a)-> if isNaN(a) then '' else a + 1 ).join("")
        # True when the user answer all the questions
        done: => @hash().length >= 4 # is @values().length
        # Returns the last index without answer
        index: => _.findIndex @values(), (q)-> not q.userAnswer?
        # Get results for a given questions hash
        result: (hash)=>
          # Build a uniq path to the json describing the result
          $http.get(app.cdn.location + hash + '.json', cache: yes).then (d)=> d.data
