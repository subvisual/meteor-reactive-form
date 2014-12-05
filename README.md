#Reactive form

[![Build Status](https://travis-ci.org/groupbuddies/meteor-reactive-form.svg?branch=master)](https://travis-ci.org/groupbuddies/meteor-reactive-form)

reactive-form is a Meteor package to help with complex forms where fields of the same form are distributed in multiple templates and and templates are reused.

The idea is that an reactive object, like Session, is shared across all templates. Each template can listen and update changes.

In the end a submit form can serialize the object and save it to the database.
