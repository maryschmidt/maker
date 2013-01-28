require 'spec_helper'

describe User do

  it "should #follow another user" do
    follower = create(:user)
    followed_user = create(:user)
    follower.follow! followed_user
    follower.should be_following(followed_user)
  end

  it "should #unfollow another user" do
    follower = create(:user)
    followed_user = create(:user)
    follower.follow! followed_user
    follower.unfollow! followed_user
    follower.should_not be_following(followed_user)
  end

  it "should not be able to #follow itself" do
    user = create(:user)
    user.relationships.create(followed_id: user.id)
    user.should_not be_following(user)
  end

end
