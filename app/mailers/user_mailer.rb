class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = sign_in_url
    mail(to: user.email, subject: "Welcome to My Awesome Site")
  end
end
