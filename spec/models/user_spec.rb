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

  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }
  it { should respond_to(:follow!) }
  it { should respond_to(:unfollow!) }

  describe "following" do
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @user.save
      @user.follow!(other_user)
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "followed user" do
      subject { other_user }
      its(:followers) { should include(@user) }
    end

    describe "and unfollowing" do
      before { @user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end
  end
end
