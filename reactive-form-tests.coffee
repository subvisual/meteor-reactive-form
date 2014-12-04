if Meteor.isClient
  Tinytest.add 'it is available in the global namespace', (test) ->
    test.isTrue(ReactiveForm)

  Tinytest.add 'it initializes keys passed an array', (test) ->
    keys = ['one', 'two', 'three']

    reactiveForm = new ReactiveForm(keys)

    test.isTrue(key of reactiveForm.map) for key in keys

  Tinytest.add "it defines and returns a key's value", (test) ->
    key = "key"
    value = "value"
    reactiveForm = new ReactiveForm

    reactiveForm.set(key, value)

    test.equal(value, reactiveForm.get(key))

  Tinytest.add 'it uses the right empty state for keys', (test) ->
    keys = ['one', 'two', 'three']

    ReactiveForm.emptyState(null)
    reactiveForm = new ReactiveForm(keys)

    test.equal(reactiveForm.map[key], null) for key in keys

  Tinytest.add 'it cleans resets the keys to the empty state', (test) ->
    keys = ['one', 'two', 'three']
    ReactiveForm.emptyState(null)

    reactiveForm = new ReactiveForm
    reactiveForm.set(key, "random") for key in keys
    reactiveForm.clean()

    test.equal(reactiveForm.get(key), null) for key in keys
