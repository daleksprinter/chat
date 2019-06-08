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
    p @messages
  end

  before_action :authenticate_user!
  def create
    room = Room.find_by(room_id: params[:id])
    Message.create(text:params[:text], user_id:current_user.id, room_id:room.id)
  end

  before_action :authenticate_user!
  def addRoom
    @room = Room.new()
  end

  def createRoom
    if Room.exists?(:room_id => params[:roomid])
      if params[:password] == params[:confirmpassword]
        newRoom = Room.create(room_id:params[:roomid], room_name:params[:roomname], password:params[:password])
        newRoom.save
        Join.create(user_id:current_user.id, room_id:newRoom.id)
        redirect_to :controller => 'chat', :action => 'show', :id => params[:roomid]
      else 
        p 'password is not same'
      end
    else
      p 'room exists'
    end

  end

  def joinRoom
    if Room.exists?(:room_id => params[:roomid])
      room = Room.find_by(room_id: params[:roomid])
      if room.password == params[:password] 
        Join.create(room_id: room.id, user_id: current_user.id)
        redirect_to :controller => 'chat', :action => 'show', :id => room.room_id
      else 
        p 'password incorrect'
      end
    else
      p 'not exist'
    end
  end


end
