class AttractionsController < ApplicationController
  before_action :require_login
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]

  #C
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  #R
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @ride = Ride.new
  end

  #U
  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  #D
  def destroy
    Attraction.find_by_id(params[:id]).destroy
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
  
  def find_user
    @user = User.find(session[:user_id])
  end
  
  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

end
