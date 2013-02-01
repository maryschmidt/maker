class UserMailer < ActionMailer::Base
  default from: "mary@apprentice.io"

  def welcome_email(user)
    @user = user
    @url  = sign_in_url
    mail(to: user.email, subject: "Welcome!")
  end

  def follow_email(user, follower)
    @user = user
    @follower = follower
    mail(to: user.email, subject: "You've got a follower!")
  end
end
