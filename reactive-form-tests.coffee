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

  Tinytest.add 'it resets the keys to the empty state', (test) ->
    keys = ['one', 'two', 'three']
    ReactiveForm.emptyState(null)

    reactiveForm = new ReactiveForm
    reactiveForm.set(key, "random") for key in keys
    reactiveForm.clean()

    test.equal(reactiveForm.get(key), null) for key in keys

  Tinytest.add 'it resets some keys to the empty state', (test) ->
    keys = ['one', 'two', 'three']
    ReactiveForm.emptyState(null)

    reactiveForm = new ReactiveForm
    reactiveForm.set(key, 'random') for key in keys
    reactiveForm.clean(['one'])

    test.equal(reactiveForm.get('one'), null) for key in keys
    test.equal(reactiveForm.get(key), 'random') for key in ['two', 'three']

  Tinytest.add 'it returns true if all keys are valid', (test) ->
    keys = ['one', 'two', 'three']
    reactiveForm = new ReactiveForm(keys)

    reactiveForm.set(key, 'random') for key in keys

    test.isTrue(reactiveForm.valid())

  Tinytest.add 'it returns false if any key is invalid', (test) ->
    keys = ['one', 'two', 'three']
    reactiveForm = new ReactiveForm(keys)

    reactiveForm.set('one', 'random')

    test.isFalse(reactiveForm.valid())

  Tinytest.add 'it returns true if the passed keys are valid', (test) ->
    keys = ['one', 'two', 'three']
    reactiveForm = new ReactiveForm(keys)

    reactiveForm.set('one', 'random')

    test.isTrue(reactiveForm.valid(['one']))

  Tinytest.add 'it returns false if the passed keys are invalid', (test) ->
    keys = ['one', 'two', 'three']
    reactiveForm = new ReactiveForm(keys)

    reactiveForm.set('two', 'random')

    test.isFalse(reactiveForm.valid(['one']))

  Tinytest.add 'it returns a curry set function', (test) ->
    reactiveForm = new ReactiveForm

    f = reactiveForm.setCurry('key')
    f('value')

    test.equal(reactiveForm.get('key'), 'value')

  Tinytest.add 'it returns a curry get function', (test) ->
    reactiveForm = new ReactiveForm
    reactiveForm.set('key', 'value')

    f = reactiveForm.getCurry('key')

    test.equal(f(), 'value')
