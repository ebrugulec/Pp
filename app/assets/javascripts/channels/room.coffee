App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
     active_chatroom = $("[data-behavior='receiver'][data-chatroom-id='#{data.chatroom_id}']")
     console.log('room')
     console.log(data)
     if active_chatroom["length"] > 0
       active_chatroom.append(data.message)
      # scroll_bottom()

# $(document).on 'turbolinks:load', ->
#   submit_message()
#   scroll_bottom()
#
# submit_message = () ->
#   $('#message_content').on 'keydown', (event) ->
#     if event.keyCode is 13 && !event.shiftKey
#       $('input').click()
#       event.target.value = ""
#       event.preventDefault()
#
# scroll_bottom = () ->
#   $('#messages').scrollTop($('#messages')[0].scrollHeight)
