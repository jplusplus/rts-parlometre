'use strict'

angular.module 'rtsDialectsApp'
  .controller 'MainCtrl', ($scope, $state, Questions)->
    # Returns the last index without answer
    index = do Questions.index
    # List of questions
    $scope.questions = questions = Questions.values()
    # True when the user answer all the questions
    $scope.done = Questions.done
    # Pick a question the next at the given index
    $scope.pick = (index)->
      # Until this end
      if do Questions.done
        # Go to the final page
        return $state.go 'main.outro', hash: do Questions.hash
      # Current question index
      $scope.index = index
      # Current question
      $scope.question  = questions[index]
      # Set the previous question
      $scope.previous = if index then questions[index - 1] else null
    # Start with the first question
    $scope.pick index
    # Move to final screen if the user didn't answer yet
    $scope.$on '$stateChangeSuccess', (event, next)->
      # Avoid answering twice
      next.name is 'main' and $scope.pick index
