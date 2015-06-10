'use strict'

angular
  .module 'rtsDialectsApp'
    .controller 'MainDoneCtrl', ($scope, $state, Questions)->
      # Leave the modal if the user never done the form
      return $state.go('main') unless do Questions.done
      # To create a link to outro
      $scope.hash = do Questions.hash
      # Pre-load results
      Questions.result $scope.hash
