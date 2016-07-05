'use strict';

/* Controllers */

angular.module('myApp.controllers', ['ui.sortable', 'ngRoute'])
  .controller('DmcCtrl', ['cards', '$scope', '$route', '$location', '$routeParams', function(cards, $scope, $route, $location, $routeParams) {
    $scope.$route = $route;
    $scope.$location = $location;
    $scope.cards = cards.cards;
    $scope.optionId = $routeParams.optionId;

    $scope.sortableOptions = {
      stop: function (e, ui) {
        cards.storeAll();
      }
    };

    $scope.addNote = function(category) {
      cards.addNote(category, $scope['note'+category]);
      $scope['note'+category] = "";
    }

    $scope.removeNote = function(category, index) {
      cards.removeNote(category, index);
    }
  }])
  .controller('DashboardCtrl', ['cards', '$scope', function(cards, $scope) {
    $scope.loadData = cards.loadData;
    $scope.cards = cards.cards;
    $scope.removeEverything = cards.removeEverything;
  }]);
