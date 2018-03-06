$(document).on "turbolinks:load", ->
  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()

  $('#new_message').on "submit", (e) ->
    e.preventDefault()
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
    content     = $("#message_content")

    App.chatrooms.send_message(chatroom_id, content.val())

    content.val("")
