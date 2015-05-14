angular
  .module('rtsDialectsApp')
    .directive 'main', ($window, Questions) ->
      restrict: 'C'
      link: ($scope, element, $attrs)->
        # Redraw the form container
        draw = ->
          # Retreive questions position
          index = do Questions.index
          # Reference width
          width = angular.element('.main__container__wrapper').width()
          # Calculate the current offset
          # according the windows width
          offset = if $($window).width() >= 1100 then width/2 else 0
          # Calculate the current left position of the container
          left = !index or (-width * index) + offset
          # Scroll to the current question
          container = angular.element '.main__container__questions'
          # Scroll inside the wrapper by moving the container
          snabbt  container,
            duration: 400
            position: [ left, 0, 0]
        # Wait for change on the questions index
        $scope.$on 'questions:index', draw
        # Wait for the $window to be resized to redraw
        # (we don't need to $apply the event because no scope value is updated)
        angular.element($window).on 'resize', draw
