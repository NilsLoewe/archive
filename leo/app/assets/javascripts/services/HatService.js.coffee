angular.module('leo').factory 'Hat', ($resource, $http) ->
  class Hat
    constructor: (errorHandler) ->
      @service = $resource('/api/hats/:id',
        {id: '@id'},
        {update: {method: 'PATCH'}})
      @errorHandler = errorHandler 

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    create: (attrs, successHandler) ->
      new @service(hat: attrs).$save ((hat) -> successHandler(hat)), @errorHandler

    delete: (hat) ->
      new @service().$delete {id: hat.id}, (-> null), @errorHandler

    update: (hat, attrs) ->
      new @service(hat: attrs).$update {id: hat.id}, (-> null), @errorHandler
      
    all: ->
      @service.query((-> null), @errorHandler)

    find: (id, successHandler) ->
      @service.get(id: id, ((hat)->
        successHandler?(hat)
        hat),
       @errorHandler)
