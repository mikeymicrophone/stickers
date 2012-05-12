$ ->
  $("#tierings").sortable
    axis: "y"
    dropOnEmpty: false
    cursor: "crosshair"
    handle: '#running_average'
    items: "li"
    opacity: 0.4
    scroll: true
    update: ->
      $.ajax "/tierings/sort",
        type: "post"
        data: $("#tierings").sortable("serialize")
        dataType: "script"