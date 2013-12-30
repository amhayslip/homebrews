class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(params)
    redirect_to root_path
  end





  
end
