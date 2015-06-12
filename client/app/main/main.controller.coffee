'use strict'

angular.module 'rtsDialectsApp'
  .controller 'MainCtrl', ($scope, $state, $document, $window, app, Questions)->
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
        return $state.go 'main.done'
      # Current question index
      $scope.index = index
      # Current question
      $scope.current  = questions[index]
      # Set the previous question
      $scope.previous = if index then questions[index - 1] else null
    # Returns the clas to apply to a question according its index
    $scope.questionClass = (i)->
       'main__container__questions__item__form--previous': i < $scope.index,
       'main__container__questions__item__form--next': i > $scope.index,
       'main__container__questions__item__form--hidden': i > $scope.index or i < $scope.index - 1
    # Returns the map for a given question/answer pair
    $scope.answerMap = (question)->
      # No answer, no map
      return null unless question.userAnswer?
      # Use a CDN to retreive the image
      app.cdn.location + 'questions/' + question.id + '-' + (question.userAnswer + 1) + '.png'
    # Move to final screen if the user didn't answer yet
    $scope.$on '$stateChangeSuccess', (event, next)->
      # Avoid answering twice
      next.name is 'main' and $scope.pick $scope.index
