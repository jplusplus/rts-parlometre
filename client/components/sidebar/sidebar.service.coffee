'use strict'

angular.module 'rtsDialectsApp'
  .service 'Sidebar', class
    isCollapsed: yes
    toggle: => @isCollapsed = !@isCollapsed
