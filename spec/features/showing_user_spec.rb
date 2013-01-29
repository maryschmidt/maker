require "spec_helper"

feature "users#show page" do
  scenario "display numbers for following and followers" do
    follow_user
    visit user_path(user)
    expect(page).to have_content("Following: 1")
    visit user_path(project.user)
    expect(page).to have_content("Followers: 1")
  end

  let(:user) { create(:user) }
  let(:project) { create(:project) }

  def follow_user
    sign_in user
    visit project_path(project)
    click_button "Follow"
  end
end
