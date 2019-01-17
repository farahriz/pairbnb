class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def booking_email(user,host)
    @host = host
    @user = user
    @url  = 'localhost:3000'
    mail(to: @host.email, subject: 'Welcome to My Awesome Site')
  end
end