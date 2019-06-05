class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def show
  end
  def edit
    # ...
  end
  def update
    # ...
  end
  def destroy
    # ...
  end

  def index
    @restaurants = Restaurant.all
  end
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @restaurant.update(restaurant_params)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number )
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
