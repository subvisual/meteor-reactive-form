class @ReactiveForm
  @_emptyState: undefined

  @emptyState: (state) ->
    @_emptyState = state

  map: {}

  constructor: (keys) ->
    if _.isArray(keys)
      @map[key] = @constructor._emptyState for key in keys

  get: (key) =>
    @map[key]

  set: (key, value) =>
    @map[key] = value

  clean: =>
    @map[key] = @constructor._emptyState for key in Object.keys(@map)
