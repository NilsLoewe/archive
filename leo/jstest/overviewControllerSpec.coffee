describe 'OverviewController', ->
  class Hat
    constructor: (_) ->
    all: -> []
    create: (t) -> t
    delete: (_) ->
 
  beforeEach ->
    module('leo')

  beforeEach ->
    inject ($rootScope, $controller, $injector, Hat) =>
      @Hat = Hat
      spyOn(@Hat.prototype, 'find').andReturn({title: "Your hat"})
      @scope = $rootScope.$new()
      @ctrl = $controller "OverviewController", $scope: @scope, Hat: @Hat

  describe 'after initialization', ->
    beforeEach ->
      @scope.init()

    describe 'addHat', ->
      it 'should clear input when adding hat', ->
        @scope.hatTitle = "First Hat"
        @scope.addHat()
        expect(@scope.hatTitle).toEqual("")

