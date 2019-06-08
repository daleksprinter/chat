document.addEventListener 'turbolinks:load', ->
  room_id = document.getElementById('room_id').textContent
  console.log(room_id)
  App.room = App.cable.subscriptions.create { channel : "RoomChannel", room_id : room_id },
    connected: ->

    disconnected: ->

    received: (data) ->
      document.getElementById('text').value = "";
      message = '<li>' + data['message']['message'] + ' ' + data['message']['user'] + '</li>'
      document.getElementById('messages').innerHTML += message

    speak: (message, room, user)->
      @perform 'speak', message: message, room: room, user: user