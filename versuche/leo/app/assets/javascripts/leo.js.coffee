leo = angular.module("leo", ["ngResource", "ngRoute", "ui.sortable"])

leo.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

leo.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/', redirectTo: '/overview'
  $routeProvider.when '/users/edit', templateUrl: '/users/edit.html'
  $routeProvider.when '/overview', templateUrl: '/templates/overview.html', controller: 'OverviewController'

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
