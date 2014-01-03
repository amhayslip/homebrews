class FriendshipsController < ApplicationController

  before_filter :authenticate_user!


  def index
    @friendships = current_user.friendships.all
  end

  def accept 
    @friendship = current_user.friendships.find(params[:id]) 
    if @friendship.accept!
      flash[:success] = "You are now friends with #{@friendship.friend.name}"
    else
      flash[:error] = "That friendship could not be accepted."
    end
    redirect_to friendships_path
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def edit
    @friendship = current_user.friendships.find(params[:id])
    @friend = @friendship.friend
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end

end
