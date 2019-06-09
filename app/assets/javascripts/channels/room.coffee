document.addEventListener 'turbolinks:load', ->
  room_id = document.getElementById('room_id').textContent
  App.room = App.cable.subscriptions.create { channel : "RoomChannel", room_id : room_id },
    connected: ->

    disconnected: ->

    received: (data) ->
      if document.getElementById('user_id').textContent == data['message']['user']
        document.getElementById('text').value = ""
        dom = "<div class = 'message'>"+"<div style = 'font-size:14px'>" + data['message']['user'] + "</div>"+"<div>" + data['message']['message'] + "</div>"+"</div>"
        document.getElementById('messages').innerHTML += dom
      else 
        dom = "<div class = 'message-other'>"+"<div style = 'font-size:14px'>" + data['message']['user'] + "</div>"+"<div>" + data['message']['message'] + "</div>"+"</div>"
        document.getElementById('messages').innerHTML += dom


    speak: (message, room, user)->
      if !(message == '')
        @perform 'speak', message: message, room: room, user: user