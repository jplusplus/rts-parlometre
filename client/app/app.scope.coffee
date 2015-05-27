angular
  .module 'rtsDialectsApp'
    # Config the rootscope for global functions and attributes
    .run ($rootScope, $window, Sidebar)->
      $rootScope.sidebar = Sidebar
      # True when the window is in small mode;
      # the 910 value is arbitrary.
      # @see app/main.less
      $rootScope.showPrevious = -> $( $window ).width() > 910
