'use strict'

angular.module 'rtsDialectsApp'
  .controller 'SidebarCtrl', ($scope, Questions)->
    $scope.done = Questions.done
    $scope.hash = Questions.hash
