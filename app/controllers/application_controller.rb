class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  def current_project
    @current_project = Project.find(params[:project_id])
  end
  helper_method :current_project
end
