$(document).on "turbolinks:load", ->
  $("#new_direct_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()
      event.target.value = ""
