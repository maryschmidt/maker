require 'spec_helper'

describe Project do
  xit "should create projects with title and description" do
    user = FactoryGirl.create(:user, :email => 'test@email.com', :password => 'password')
    project = FactoryGirl.build(:project, :title => 'title', :description => 'desc')
    project.new_record?.should == true
    project.user.new_record?.should == true
  end

  it "should belong to a user" do
    user = create(:user)
    project = create(:project, user: user)
    project.user.should == user
  end
end
