# @src https://github.com/fronteed/icheck/issues/62#issuecomment-96048506
angular
  .module('rtsDialectsApp')
    .directive 'icheck', ($timeout, $parse) ->
      require: 'ngModel'
      link: ($scope, element, $attrs, ngModel) ->
        $timeout (->
          value = $attrs['value']
          $scope.$watch $attrs['ngModel'], (newValue) ->
            $(element).iCheck 'update'
            return
          $scope.$watch $attrs['ngDisabled'], (newValue) ->
            $(element).iCheck if newValue then 'disable' else 'enable'
            $(element).iCheck 'update'
            return
          $(element).iCheck(
            checkboxClass: 'icheckbox_square-yellow icheckbox'
            radioClass: 'iradio_square-yellow iradio').on 'ifToggled', (event) ->
            if $(element).attr('type') == 'checkbox' and $attrs['ngModel']
              $scope.$apply ->
                ngModel.$setViewValue event.target.checked
            if $(element).attr('type') == 'radio' and $attrs['ngModel']
              return $scope.$apply(->
                ngModel.$setViewValue value
              )
            return
        ), 300
