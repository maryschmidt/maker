require "spec_helper"

feature "users#show page" do
  scenario "a user visits his user page" do
    make_user
    visit user_path(@user)
    expect(page).to have_content("Followers")
  end

  scenario "display numbers for following and followers" do
    make_followable_user
    make_user
    follow_and_see
    expect(page).to have_content("Following: 1")
  end

  def make_user
    @user = create(:user)
    sign_in @user
  end

  def make_followable_user
    followable_user = create(:user)
    sign_in followable_user
    @project = create(:project)
    sign_out followable_user
  end

  def follow_and_see
    visit project_path(@project)
    click_button "Follow"
    visit user_path(@user)
  end
end
