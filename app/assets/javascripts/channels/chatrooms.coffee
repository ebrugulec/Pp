App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if active_chatroom["length"] > 0
      active_chatroom.append(data.message)
    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold")

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, content: message}
