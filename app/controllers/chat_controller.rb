class ChatController < ApplicationController
  before_action :authenticate_user!
  def index
    user = User.find_by(name: current_user.name)
    @tmp = Room.find_by_sql(['select * from joins left outer join rooms on joins.room_id = rooms.id where joins.user_id = ?', user.id])
  end
end
