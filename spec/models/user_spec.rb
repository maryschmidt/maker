require 'spec_helper'

describe User do
  it "should authenticate users with correct email and password" do
    user = FactoryGirl.create(:user, :email => 'test@email.com', :password => 'password')
    User.authenticate('test@email.com', 'password').should == user
  end

  it "should not authenticate users with incorrect email and password" do
    user = FactoryGirl.create(:user, :email => 'test@email.com', :password => 'password')
    User.authenticate('email@email.com', 'password').should == nil
  end

end
