class SessionsController < Clearance::SessionsController
  protected
  def url_after_create
    dashboard_projects_path
  end
end
