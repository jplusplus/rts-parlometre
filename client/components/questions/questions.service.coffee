'use strict'

angular
  .module 'rtsDialectsApp'
    .service 'Questions', (app, $http, $rootScope, r)->
      new class
        constructor: ->
          @promise = $http
            .get 'assets/data/questions.json'
            .then (res)=>
              @questions = res.data
              # Watch for chanhes on the question index
              $rootScope.$watch @index, =>
                # Change the status to 'pending' when the survey is done
                @status = 'pending' if do @done and @status isnt 'saved'
                # Broadcast the change
                $rootScope.$broadcast 'questions:index'
        # Status of the done
        status: 'answering'
        # Get questions using a promises
        get: => @promise
        # Get the raw values
        values: => @questions or []
        # Save the user answers with additional information
        save: (answer)=>
          # Must not be saved already
          return no if @status isnt 'pending'
          # Get the hash from the current survey
          answer.hash = do @hash
          # Send the answer
          r.all('answers').post answer
          # The poll is now saved
          @status = 'saved'
        # Generate a hash of answer using the user's answers.
        # The hash is made to match with R-generated map. With R, indexes
        # start at 1, not 0. So we add 1 to every answer's index.
        hash: => _.map( _.pluck(@values(), "userAnswer"), (a)-> if isNaN(a) then '' else a + 1 ).join("")
        # True when the user answer all the questions
        done: => @hash().length is @values().length
        # Returns the last index without answer
        index: => _.findIndex @values(), (q)-> not q.userAnswer?
        # True if the browser supports CORS
        allowCors: => 'withCredentials' of new XMLHttpRequest
        # Get results for a given questions hash
        result: (hash)=>
          location = if do @allowCors then app.generator.location else app.generator.proxy
          # Build a uniq path to the json describing the result
          $http.get(location + '?hash=' + hash, cache: yes).then (d)=>
            result = d.data
            # Cantons list
            result.cantons = _.reduce result.cantons, (result, value, code)->
              # Create a new object for each canton
              result.push angular.extend({ code: code, value: value }, app.cantons[code])
              result
            # We have to transform the cantons object to a an array
            , []
            # Sort by value
            result.cantons = _.sortBy result.cantons, (c)-> -1 * c.value
            # Returns everything
            result
