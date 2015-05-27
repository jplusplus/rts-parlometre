'use strict'

angular.module 'rtsDialectsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main.outro.save',
    onEnter: ($state, $modal, Questions)->
      # Leave the modal if the user never done the form
      return $state.go('main.outro') unless do Questions.done
      # Function to go back to the parent state
      goBack = -> $state.go 'main.outro'
      # Create a modal
      $modal.open(
        templateUrl: 'app/main/outro/save/save.html'
        controller: 'MainOutroSaveCtrl'
        resolve:
          # Resolve ineritence from the parent state
          questions: Questions.values
          cities: ($http)->
            $http.get('assets/data/cities.json').then (res)-> res.data
      ).result.then goBack, goBack
