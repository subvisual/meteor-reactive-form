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

  getCurry: (key) =>
    return =>
      @get(key)

  set: (key, value) =>
    @dep.changed()
    @map[key] = value

  setCurry: (key) =>
    return (value) =>
      @set(key, value)

  valid: (keys) =>
    if !_.isArray(keys)
      keys = Object.keys(@map)
    _.every keys, (key) =>
      @map[key] != @constructor._emptyState

  clean: (keys) =>
    @dep.changed()
    if !_.isArray(keys)
      keys = Object.keys(@map)
    @map[key] = @constructor._emptyState for key in keys
