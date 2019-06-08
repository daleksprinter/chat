class ChatController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.new()
  end
  
  before_action :authenticate_user!
  def show
    @current_user = current_user
    room_id = params[:id]
    @room = Room.find_by(room_id: room_id)
    sql = 'select * 
            from users join messages on messages.user_id = users.id 
            where messages.room_id = ?'
    @messages = User.find_by_sql([sql, @room.id])
  end

  before_action :authenticate_user!
  def create
    room = Room.find_by(room_id: params[:id])
    Message.create(text:params[:text], user_id:current_user.id, room_id:room.id)
  end

  def addRoom
    @room = Room.new()
  end

  def createRoom
    newRoom = Room.create(room_id:params[:roomid], room_name:params[:roomname], password:params[:password])
    newRoom.save
    Join.create(user_id:current_user.id, room_id:newRoom.id)
    redirect_to :controller => 'chat', :action => 'show', :id => params[:roomid]

  end

  def joinRoom
  end


end
