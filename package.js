Package.describe({
  name: 'gabrielpoca:reactive-form',
  summary: ' /* Fill me in! */ ',
  version: '0.0.0',
  git: ' /* Fill me in! */ '
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@1');

  api.use([
    'coffeescript'
  ], 'client');

  api.addFiles([
    'reactive-form.coffee'
  ], 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('coffeescript');
  api.use('gabrielpoca:reactive-form');
  api.addFiles('reactive-form-tests.coffee');
});
