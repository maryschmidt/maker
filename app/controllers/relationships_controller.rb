class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])
    if @user.id == current_user.id
      redirect_to current_user, notice: "Watch those id's"
    else
      current_user.follow!(@user)
      redirect_to current_user
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to current_user
  end
end
