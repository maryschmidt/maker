class SessionsController < Clearance::SessionsController
  protected
  def url_after_create
    @user
  end
end
