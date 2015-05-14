angular
  .module('rtsDialectsApp')
    .animation ".slide", ()->
      enter: (element, done)->
        jQuery(element).hide().slideDown(600, done)

      leave: (element, done)->
        jQuery(element).show().slideUp(600, done)

      beforeAddClass: (element, className, done)->
          if className is "ng-hide"
              jQuery(element).show().slideUp(600, done)
          return null

      removeClass: (element, className, done)->
          if className is "ng-hide"
              jQuery(element).hide().slideDown(600, done)
          return null
