'use strict';


// Declare app level module which depends on filters, and services
angular.module('myApp', [
  'ngRoute',
  'myApp.filters',
  'myApp.services',
  'myApp.directives',
  'myApp.controllers'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/start', {templateUrl: 'partials/start.html', controller: 'DmcCtrl'});
  $routeProvider.when('/dmc1', {templateUrl: 'partials/dmc1.html', controller: 'DmcCtrl'});
  $routeProvider.when('/dmc2', {templateUrl: 'partials/dmc2.html', controller: 'DmcCtrl'});
  $routeProvider.when('/dmc3', {templateUrl: 'partials/dmc3.html', controller: 'DmcCtrl'});
  $routeProvider.when('/option/:optionId', {templateUrl: 'partials/option.html', controller: 'DmcCtrl'});
  $routeProvider.when('/constraint', {templateUrl: 'partials/constraint.html', controller: 'DmcCtrl'});
  $routeProvider.when('/source/:optionId', {templateUrl: 'partials/source.html', controller: 'DmcCtrl'});
  $routeProvider.when('/knowledge/:optionId', {templateUrl: 'partials/knowledge.html', controller: 'DmcCtrl'});
  $routeProvider.when('/dashboard', {templateUrl: 'partials/partial2.html', controller: 'DashboardCtrl'});
  $routeProvider.otherwise({redirectTo: '/start'});
}]);
