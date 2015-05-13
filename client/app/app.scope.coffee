angular
  .module 'rtsDialectsApp'
    # Config the rootscope for global functions and attributes
    .run ($rootScope, Sidebar)->
      $rootScope.sidebar = Sidebar
