class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    send_notification(@user, current_user)
    redirect_to current_user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to current_user
  end

  private
  def send_notification(followed_user, follower)
    UserMailer.follow_email(followed_user, follower).deliver
  end
end
