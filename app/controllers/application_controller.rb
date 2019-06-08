class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_id])
    end

    before_action :get_room_current_user
    def get_room_current_user
        @rooms = []
        if user_signed_in?
            user = User.find_by(name: current_user.name)
            sql = 'select * 
                from joins left outer join rooms on joins.room_id = rooms.id 
                where joins.user_id = ?'
            @rooms = Room.find_by_sql([sql, user.id])
        end
    end
end
