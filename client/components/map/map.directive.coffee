angular
  .module('rtsDialectsApp')
    .directive 'map', (r, app, Questions, Cities)->
      restrict: 'AE'
      replace: no
      templateUrl: 'components/map/map.html'
      scope:
        hash: "="
      link: (scope, element, $attrs) ->
        # Drawing function
        draw = (result)->
          pixels = result.image
          # Square size
          square = 1
          # Each pixel is defined using an hexadecimal value
          for pixel, index in pixels
            if pixel isnt '.'
              # Pixel position
              x = ~~( index % (width / square) ) * square
              y = height - ~~( index * (square / width) ) * square
              # Convert to decimal value
              value = parseInt pixel, 16
              # Get the color from the value
              context.fillStyle = do color(value).hex
              # Draw on the canvas
              context.fillRect x, y, square, square
          # To draw cities, we need to expend there code to properties
          scope.cities = _.map result.communes, Cities.find
          # Copy to the image tag
          element.find(".map__img").attr 'src', canvas[0].toDataURL()
        # Create color scales
        color = chroma.scale(app.map.colors).domain app.map.domain
        # Default sizes
        width = 196
        height = width
        # Canvas element
        canvas = $("<canvas />").attr width: width, height: height
        context = canvas[0].getContext "2d"
        # Gets the map
        Questions.result(scope.hash).then draw
