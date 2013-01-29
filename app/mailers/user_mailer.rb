class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = sign_in_url
    mail(to: user.email, subject: "Welcome to My Awesome Site")
  end

  def follow_email(user, follower)
    @user = user
    @follower = follower
    mail(to: user.email, subject: "You've got a follower!")
  end
end
