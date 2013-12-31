class UserNotifier < ActionMailer::Base
  default from: "amhayslip@gmail.com"


  def friend_requested(friendship_id)
    friendship = Friendship.find(friendship_id)

    @user = friendship.user
    @friend = friendship.friend

    mail to: @friend.email, 
      subject: "#{@user.name} wants to be friends on Homebrews"

  end

  def friend_requested_accepted(friendship_id)
    friendship = Friendship.find(friendship_id)

    @user = friendship.user
    @friend = friendship.friend

    mail to: @user.email, 
      subject: "#{@friend.name} has accepted your friend request"

  end



end
