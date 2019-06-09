class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room_id']}"
  end

  def unsubscribed

  end

  def speak(data)
      user = User.find_by(user_id: data['user'])
      room = Room.find_by(room_id: data['room'])
      msg = Message.new(text:data['message'], user_id:user.id, room_id: room.id)
      msg.save
      ActionCable.server.broadcast 'room_channel_' + data['room'], message: data
  end
end
