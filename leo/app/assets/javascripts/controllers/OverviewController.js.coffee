angular.module('leo').controller "OverviewController", ($scope, $routeParams, $location, Hat) ->

  $scope.init = ->
    @hatsService = new Hat(serverErrorHandler)
    $scope.hats = @hatsService.all()

  $scope.createHat = (title) ->
    raisePriorities()
    hat = @hatsService.create title: title, (hat) ->
        $scope.hatTitle = ""
        $scope.hats.unshift(hat)
        hat.priority = 1
        $location.url("/overview")

  $scope.addHat = (title) ->
    hat = @hatsService.create title: title, (hat) ->
        $scope.hats.unshift(hat)
        $location.url("/overview")
    hat.priority = 1
    $scope.hats.unshift(hat)
    $scope.hatTitle = ""

  $scope.deleteHat = (hat, index) ->
    result = confirm "Are you sure you want to remove this hat?"

    if result
      @hatsService.delete hat
      $scope.hats.splice index, 1

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")

  raisePriorities = ->
    angular.forEach $scope.hats, (t) -> t.priority += 1
