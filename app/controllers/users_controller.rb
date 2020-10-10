class UsersController < ApplicationController    

    #C
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        end
    end

    #R
    def show
        set_user
        if logged_in?
        else
            redirect_to root_path
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end

    def logged_in?
        session[:user_id] == @user.id
    end
    
end
