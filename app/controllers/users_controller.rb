class UsersController < ApplicationController
    def index
        @users = User.all
    end
     
    def destroy
        if current_user.has_role?(:admin)
        User.find(params[:id]).destroy
        redirect_to root_path
        else
        flash[:alert] = "That don't work! I see you!"
        redirect_to root_path
        end
    end
end
