class Home::ProjectsController < ApplicationController
  skip_before_filter :authorize

  def index
    @projects = Project.recent(20)
  end
end
