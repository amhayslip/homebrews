class BeersController < ApplicationController
  def show
    @beer = Beer.find(params[:id])
  end
  
  def index
    @beers = Beer.all
  end
  
  def new
    @user = User.find(params[:user_id])
    @beer = @user.beers.new
  end
  
  
  def create
    @user = User.find(params[:user_id])
    @beer = @user.beers.new(beer_params)
    @beer.save
    redirect_to current_user
  end

  def edit
    @beer = Beer.find(params[:id])
    @beer.user_id = params[:user_id]
  end
  
  def update
    @beer = Beer.find(params[:id])
    user = User.find(@beer.user_id)
    @beer.update(beer_params)
    redirect_to user_path(user.id)
  end
  
  def destroy
    @beer = Beer.find(params[:id])
    user = User.find(@beer.user_id)
    @beer.destroy
    redirect_to user_path(user.id)
  end
  
  private
  def beer_params
    params.require(:beer).permit(:user_id, :name, :beer_pic)
  end

end