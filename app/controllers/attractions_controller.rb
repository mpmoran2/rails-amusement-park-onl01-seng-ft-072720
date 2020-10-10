class AttractionsController < ApplicationController
  #C
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    end
  end

  #R
  def index
    current_user
    @attractions = Attraction.all
  end
  
  def show
    current_user
    set_attraction
    @ride = Ride.new
  end

  #U
  def edit
    set_attraction
  end

  def update
    set_attraction
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  #D
  def destroy
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end
