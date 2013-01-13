require 'spec_helper'

describe Goal do
  it "should belong to a user" do
    user = create(:user)
    goal = create(:goal, user: user)
    goal.user.should == user
  end
end
