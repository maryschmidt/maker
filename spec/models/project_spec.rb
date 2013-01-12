require 'spec_helper'

describe Project do
  it "should belong to a user" do
    user = create(:user)
    project = create(:project, user: user)
    project.user.should == user
  end
end
