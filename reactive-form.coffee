class @ReactiveForm
  @_emptyState: undefined

  @emptyState: (state) ->
    @_emptyState = state

  constructor: (keys) ->
    @map =  {}
    @dep = new Tracker.Dependency
    if _.isArray(keys)
      @map[key] = @constructor._emptyState for key in keys

  get: (key) =>
    @dep.depend()
    @map[key]

  set: (key, value) =>
    @map[key] = value
    @dep.changed()

  valid: (keys) =>
    if !_.isArray(keys)
      keys = Object.keys(@map)
    _.every keys, (key) =>
      @map[key] != @constructor._emptyState

  clean: (keys) =>
    if !_.isArray(keys)
      keys = Object.keys(@map)
    @map[key] = @constructor._emptyState for key in keys
    @dep.changed()
