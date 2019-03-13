class RestaurantsController < ApplicationController
  before_action :select_restaurant, only: %i[update show delete]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)
    @restaurant.save
    if @restaurant.errors.any?
      render :new
    else
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @restaurant.destroy
  end

  def show
  end

  private

  def select_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def strong_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
