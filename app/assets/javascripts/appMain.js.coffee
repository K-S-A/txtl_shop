"use strict"

angular.module('storeApp', [
  'templates'
  'ui.bootstrap'
  'ui.router'
  'Devise'
]).config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
    .state('main',
      url: '/'
      templateUrl: 'main/main.html'
      controller: 'MainCtrl as vm')
    .state('register',
      url: '/registration',
      templateUrl: 'auth/register.html'
      controller: 'AuthCtrl as vm')

    $urlRouterProvider.otherwise '/'
    return
]
