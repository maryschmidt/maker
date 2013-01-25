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
      sign_in
      visit project_path(@project)
      fill_in "comment_body", with: @text
      click_button "Comment"
    end

    def visible?
      within ".comment" do
        page.has_text?(@text) && page.has_text?(@user.name)
      end
    end
  end
end
