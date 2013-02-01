require "spec_helper"

feature "User goals" do
  scenario "User makes a goal" do
    user = create(:user)
    sign_in user
    visit new_goal_path
    goal = create(:goal)
    Goal.count.should == 1
  end
end
