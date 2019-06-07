class ChatController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  before_action :authenticate_user!
  def show
    room_id = params[:id]


  end
end
