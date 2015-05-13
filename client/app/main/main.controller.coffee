'use strict'

angular.module 'rtsDialectsApp'
  .controller 'MainCtrl', ($scope, $state, questions)->
    # List of questions
    $scope.questions = questions
    # Pick a question the next at the given index
    $scope.pick = (index)->
      # Until this end
      if index is questions.length
        # Go to the final page
        return $state.go 'outro', questions: questions
      # Current question index
      $scope.index = index
      # Current question
      $scope.question  = questions[index]
      # Set the previous question
      $scope.previous = if index then questions[index - 1] else null
    # Start with the first question
    $scope.pick 0
