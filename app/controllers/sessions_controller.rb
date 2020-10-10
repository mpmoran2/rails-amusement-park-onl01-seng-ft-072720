class SessionsController < ApplicationController

  #C
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user_password])
      set_session
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  #D
  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def set_session
    session[:user_id] = @user.id
  end

end
