'use strict'

angular
  .module 'rtsDialectsApp'
    .service 'Questions', ($http)->
      new class
        constructor: ->
          @promise = $http
            .get 'assets/data/questions.json'
            .then (res)=>
              @questions = res.data
        # Get questions using a promises
        get: => @promise
        # Get the raw values
        values: => @questions or []
        # Generate a hash of answer using the user's answers
        hash: => _.pluck(@values(), "userAnswer").join("")
        # True when the user answer all the questions
        done: => @hash().length is @values().length
        # Returns the last index without answer
        index: => _.findIndex @values(), (q)-> not q.userAnswer?
