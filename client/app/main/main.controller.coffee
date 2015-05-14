'use strict'

angular.module 'rtsDialectsApp'
  .controller 'MainCtrl', ($scope, $state, $document, $window, Questions)->
    # Returns the last index without answer
    $scope.index = do Questions.index
    # List of questions
    $scope.questions = questions = Questions.values()
    # True when the user answer all the questions
    $scope.done = Questions.done
    # Save the user choice
    $scope.save = (question, answer)->
      # Update question object
      question.userAnswer = answer
      # Picks the next question
      $scope.pick $scope.index + 1
    # Pick a question the next at the given index
    $scope.pick = (index)->
      # Until this end
      if do Questions.done
        # Go to the final page
        return $state.go 'main.outro', hash: do Questions.hash
      # Current question index
      $scope.index = index
      # Current question
      $scope.current  = questions[index]
      # Set the previous question
      $scope.previous = if index then questions[index - 1] else null
    # Returns the clas to apply to a question according its index
    $scope.questionClass = (questionIndex)->
       'main__container__questions__item__form--previous': questionIndex < $scope.index,
       'main__container__questions__item__form--next': questionIndex > $scope.index,
       'main__container__questions__item__form--hidden': questionIndex > $scope.index or questionIndex < $scope.index - 1
    # Move to final screen if the user didn't answer yet
    $scope.$on '$stateChangeSuccess', (event, next)->
      # Avoid answering twice
      next.name is 'main' and $scope.pick $scope.index
