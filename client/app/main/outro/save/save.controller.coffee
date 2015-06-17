'use strict'

angular
  .module 'rtsDialectsApp'
    .controller 'MainOutroSaveCtrl', ($scope, $timeout, $modalInstance, Questions, Sharer, result)->
      # Create a sharer object
      $scope.sharer = new Sharer result
      # Transform the note into a human readable information
      $scope.translateSatisfaction = (satisfaction)->
        switch satisfaction
          when 0
            'Pas du tout'
          when 10
            'Très satisfait'
          else
            satisfaction
      # Status of the user interaction (pending, saved, etc)
      $scope.status = -> Questions.status
      # Close the popup
      $scope.close = $modalInstance.close
      # Saving function
      $scope.save = ->
        # Pick values from the scope
        answer = _.pick $scope, ['email', 'placeOfResidence', 'placeOfBirth', 'satisfaction']
        # Save the answer
        Questions.save answer
      # Default form's values
      $scope.satisfaction = 5
      # rzSlider doesn't like to be rendered into an hidden element
      $timeout ->
        # For
        $scope.$broadcast 'reCalcViewDimensions'
      , 300
      # Always destroy the modal when living this state
      $scope.$on '$stateChangeStart', (ev, next)->
        do $modalInstance.close if next.name isnt 'main.outro.save'

