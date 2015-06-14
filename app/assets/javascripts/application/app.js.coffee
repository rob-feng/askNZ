#= require_self

#= require_tree ./helpers
#= require_tree ./templates

#= require ./mixins/base/mixin
#= require_tree ./mixins/base
#= require_tree ./mixins

#= require ./models/base/model
#= require_tree ./models/base
#= require_tree ./models

#= require ./collections/base/collection
#= require_tree ./collections/base
#= require_tree ./collections

#= require      ./routers/base/router
#= require_tree ./routers/base
#= require_tree ./routers

#= require      ./views/base/view
#= require_tree ./views/base
#= require_tree ./views

@App =
  Cache: {}
  Mixins: {}
  Helpers: {}
  Models: {}
  Collections: {}
  Routers: {}
  Views: 
    Questions: {}
    Question: {}
    Answers: {}

_.extend App, Backbone.Events

$ ->
  new App.Routers.Questions()
  Backbone.history.start()
  $.fn.editable.defaults.mode = 'inline'
  $.fn.editableform.buttons = 
  '<button type="submit" class="btn btn-success editable-submit btn-mini"><i class="icon-ok icon-white"></i></button>' +
  '<button type="button" class="btn editable-cancel btn-mini"><i class="icon-remove"></i></button>'
  $.fn.editableform.template =
  '<form class="form-inline editableform">' +
  '<div class="control-group">' +
  '<div><div class="editable-input"></div><div class="editable-buttons"></div></div>' +
  '<div class="editable-error-block"></div>' +
  '</div>' +
  '</form>' 