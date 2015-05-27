angular
  .module('rtsDialectsApp')
    .directive 'map', (r, app, Questions)->
      restrict: 'AE'
      replace: no
      template: '<img class="map" />'
      scope:
        hash: "="
        width: "=?"
      link: (scope, element, $attrs) ->
        # Drawing function
        draw = (pixels)->
          # Each pixel is defined using an hexadecimal value
          for pixel, index in pixels.slice(0, app.map.pixels)
            # Pixel position
            x = ~~( index % (scope.width / scope.square) ) * scope.square
            y = ~~( index * (scope.square / scope.width) ) * scope.square
            # Convert to decimal value
            value = parseInt pixel, 16
            # Get the color from the value
            context.fillStyle = do color(value).hex
            # Draw on the canvas
            context.fillRect x, y, scope.square, scope.square
          # Copy to the image tag
          element.find(".map").attr 'src', canvas[0].toDataURL()
        # Create color scales
        color = chroma.scale(app.map.colors).domain app.map.domain
        # Default sizes
        scope.width = scope.width or 150
        scope.height = ~~(scope.width * 1.5)
        # Square size
        scope.square = Math.sqrt((scope.width * scope.height) / app.map.pixels)
        # Canvas element
        canvas = $("<canvas />").attr width: scope.width, height: scope.height
        context = canvas[0].getContext "2d"
        # Gets the map
        Questions.pixels(scope.hash).then draw
