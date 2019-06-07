class ChatController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  before_action :authenticate_user!
  def show
    @room_id = params[:id]
    room = Room.find_by(room_id: @room_id)
    sql = 'select * 
            from users join messages on messages.user_id = users.id 
            where messages.room_id = ?'
    @messages = User.find_by_sql([sql, room.id])
  end
end
