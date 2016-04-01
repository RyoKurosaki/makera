class UserMailer < ApplicationMailer
  def registered(user, pass)
    @user = user
    @password = pass
    mail(to: user.email, subject: 'Welcome to Makera!')
  end
end
