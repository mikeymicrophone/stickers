$ ->
  $("#memberships").sortable
    axis: "x"
    dropOnEmpty: false
    cursor: "crosshair"
    handle: '.handle'
    items: ".club"
    opacity: 0.4
    scroll: true
    update: ->
      $.ajax "/memberships/sort",
        type: "post"
        data: $("#memberships").sortable("serialize")
        dataType: "script"