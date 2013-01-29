class Dashboard::ProjectsController < ApplicationController
  def index
    @projects = current_user.followed_projects.recent(10)
  end
end
