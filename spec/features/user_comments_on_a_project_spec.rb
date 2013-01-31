require "spec_helper"

feature "Project comments" do
  scenario "User comments on a project" do
    comment = ProjectCommentHarness.new "Awesome Project"
    comment.make
    expect(comment).to be_visible
  end

  class ProjectCommentHarness < TestHarness

    def initialize text
      @text = text
      @user = create(:user)
      @project = create(:project)
    end

    def make
      user ||= create(:user)
      sign_in user
      visit project_path(@project)
      fill_in "comment_body", with: @text
      click_button "Comment"
    end

    def visible?
      within ".comment" do
        page.has_text?(@text)
      end
    end
  end
end
