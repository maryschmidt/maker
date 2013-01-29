require "spec_helper"

describe UserMailer do
  it "sends an email when a user signs up" do
    user = create(:user)
    email = UserMailer.welcome_email(user).deliver
    ActionMailer::Base.deliveries.should_not be_empty
  end

  it "sends an email when a user gains a follower" do
    user = create(:user)
    follower = create(:user)
    email = UserMailer.follow_email(user, follower).deliver
    ActionMailer::Base.deliveries.should_not be_empty
  end
end
