angular
  .module('rtsDialectsApp')
    .directive 'main', ($window, $state, $timeout, Questions) ->
      restrict: 'C'
      link: ($scope, element, $attrs)->
        # Redraw the form container
        draw = ->
          # Only draw on the main state (not children)
          return unless $state.is 'main'
          # Retreive questions position
          index = do Questions.index
          # Reference width
          width = angular.element('.main__container__wrapper').width() or 550
          # Calculate the current offset
          # according the windows width
          offset = if $($window).width() > 910 then width * 0.30 else 0
          # Calculate the current left position of the container
          left = !index or (-width * index) + offset
          # Scroll to the current question
          container = angular.element '.main__container__questions'
          # Resize container according the number of items
          # and the size of the wrapper
          container.css 'width', width * Questions.values().length
          # Scroll inside the wrapper by moving the container
          snabbt  container,
            duration: 400
            position: [ left, 0, 0]
        # Wait for change on the questions index
        $scope.$on 'questions:index', draw
        # Also redraw when the state change
        $scope.$on '$stateChangeSuccess', (-> $timeout draw, 400)
        # Wait for the $window to be resized to redraw
        # (we don't need to $apply the event because no scope value is updated)
        angular.element($window).on 'resize', draw
