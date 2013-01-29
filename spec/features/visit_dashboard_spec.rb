require "spec_helper"

feature "Dashboard" do
  scenario "Showing followed projects" do
    project = DashboardHarness.new
    sign_out @followed_user
    project.populate_dashboard
    expect(project).to be_visible
  end

  scenario "Not showing users own projects" do
    project = DashboardHarness.new
    click_link "Dashboard"
    expect(project).to_not be_visible
  end

  class DashboardHarness < TestHarness

    def initialize
      @followed_user = create(:user)
      sign_in @followed_user
      @project = create(:project)
    end

    def populate_dashboard
      user = create(:user)
      sign_in user
      visit project_path(@project)
      click_button "Follow"
      click_link "Dashboard"
    end

    def visible?
      within ".user-projects-box" do
        page.has_text?(@project.title)
      end
    end
  end
end

