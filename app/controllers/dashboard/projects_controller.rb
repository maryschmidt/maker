class Dashboard::ProjectsController < ApplicationController
  def index
    @projects = current_user.followed_projects.order("updated_at DESC")
  end
end
