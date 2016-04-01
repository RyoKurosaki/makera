class RegisteredMailerJob < ActiveJob::Base
  queue_as :email

  def perform(user, pass)
    UserMailer.registered(user, pass).deliver_now
  end
end
