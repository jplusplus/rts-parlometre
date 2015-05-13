'use strict'

angular.module 'rtsDialectsApp'
  .service 'Sidebar', class
    isCollapsed: yes
    toggle: (force)=> @isCollapsed = force ? !@isCollapsed
