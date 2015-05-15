'use strict'

angular
  .module 'rtsDialectsApp'
    .controller 'MainOutroSaveCtrl', ($scope, $state, $timeout, $modalInstance, Questions)->
      # Transform the note into a human readable information
      $scope.translateNote = (note)->
        switch note
          when 0
            'Pas du tout'
          when 10
            'Trés satisfait'
          else
            note
      # Close the popup
      $scope.close = $modalInstance.close
      # Saving function
      # @NOT_INMPLEMENTED
      $scope.save = $scope.close
      # Default form's values
      $scope.note = 5
      # rzSlider doesn't like to be rendered into an hidden element
      $timeout ->
        # For
        $scope.$broadcast 'reCalcViewDimensions'
      , 300
      # Always destroy the modal when living this state
      $scope.$on '$stateChangeStart', (ev, next)->
        do $modalInstance.close if next.name isnt 'main.outro.save'

