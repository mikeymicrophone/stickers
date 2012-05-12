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

  $("#tiers").sortable
    axis: "y"
    dropOnEmpty: false
    cursor: "crosshair"
    handle: '.handle'
    items: "tbody"
    opacity: 0.4
    scroll: true
    update: ->
      $.ajax "/tiers/sort",
        type: "post"
        data: $("#tiers").sortable("serialize")
        dataType: "script"