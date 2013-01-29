require "spec_helper"

feature "user creates a project" do
  scenario "successful creation" do
    navigate_to_dashboard
    make_project
    expect(page).to have_content("Project was successfully created")
  end

  def navigate_to_dashboard
    user = create(:user)
    sign_in user
    click_link "Dashboard"
  end

  def make_project
    project = create(:project)
    click_link "New Project"
    fill_in "Title", with: "Test Project"
    fill_in "Description", with: "Test Description"
    click_button "Create Project"
  end
end
