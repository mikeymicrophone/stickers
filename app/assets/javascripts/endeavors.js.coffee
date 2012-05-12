# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#endeavors").sortable
    axis: "y"
    dropOnEmpty: false
    cursor: "crosshair"
    handle: '.handle'
    items: "tbody"
    opacity: 0.4
    scroll: true
    update: ->
      $.ajax "/endeavors/sort",
        type: "post"
        data: $("#endeavors").sortable("serialize")
        dataType: "script"