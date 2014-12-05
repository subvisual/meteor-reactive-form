var reactiveForm;
var nameKey = 'name', ageKey = 'age';

var keys = [nameKey, ageKey];

Template.form.created = function() {
  reactiveForm = new ReactiveForm(keys);
};

Template.form.helpers({
  name: function() {
    return reactiveForm.get(nameKey);
  },
  ageKey: function() {
    return ageKey;
  },
  nameKey: function() {
    return nameKey;
  },
  ageList: function() {
    return ['0-30', '31-40'];
  },
  reactiveForm: function() {
    return reactiveForm;
  }
});

Template.inputText.events({
  'keyup': function(e) {
    this.form.set(this.name, $(e.target).val());
  }
});
