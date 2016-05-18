'use strict';

/**
 * @ngdoc overview
 * @name wwwApp
 * @description
 * # wwwApp
 *
 * Main module of the application.
 */
var webstrator = angular.module('wwwApp', ['ngRoute']);

webstrator.config(function ($routeProvider) {
    $routeProvider
      .when('/main', {templateUrl: 'views/main.html', controller: 'MainCtrl'})
      .when('/about', {templateUrl: 'views/about.html', controller: 'AboutCtrl'})
      .otherwise({redirectTo: '/login'});
});
