class ChatController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  before_action :authenticate_user!
  def show
    room_id = params[:id]
    room = Room.find_by(room_id: room_id)
    @messages = Message.where(room_id: room[:id])
  end
end
