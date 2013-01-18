class UsersController < Clearance::UsersController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    super
    if @user.persisted?
      UserMailer.welcome_email(@user).deliver
    end
  end
end
