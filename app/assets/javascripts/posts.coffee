# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load, turbolinks:load', ->
  $('#froala').froalaEditor({
    htmlRemoveTags: ['script', 'style', 'iframe'],
    toolbarButtons: ['bold', 'italic', '|', 'quote', 'formatUL', 'formatOL'],
    height: 500
  })