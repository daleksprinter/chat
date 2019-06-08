document.addEventListener 'turbolinks:load', ->
  room_id = document.getElementById('room_id').textContent
  console.log room_id
  App.room = App.cable.subscriptions.create { channel : "RoomChannel", room_id : room_id },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log(data)

    speak: (message, room, user)->
      @perform 'speak', message: message, room: room, user: user