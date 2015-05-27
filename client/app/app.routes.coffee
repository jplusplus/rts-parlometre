angular
  .module 'rtsDialectsApp'
    .config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
      $urlRouterProvider.otherwise '/'
      $locationProvider.hashPrefix '!'
      $locationProvider.html5Mode no
    .run ($rootScope, $state, $window, $location, Progress, Sidebar)->
      # Redirect to login if route requires auth and you're not logged in
      $rootScope.$on '$stateChangeStart', (event, next) ->

        # Go to the top of the window
        # $("body").scrollTo 0, 400
        # Close the sidebar
        Sidebar.toggle yes
        # Start progress indicator only if there is ressource to load
        do Progress.start if _.keys(next.resolve).length > 0
      $rootScope.$on "$stateChangeSuccess", ->
        # Stop progress indicator
        do Progress.complete
        # Send 'pageview' to Google Analytics
        $window.ga('send', 'pageview', page: $location.url()) if $window.ga?
      # Stop progress indicator
      $rootScope.$on "$stateChangeError", Progress.complete
