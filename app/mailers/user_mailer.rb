class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def booking_email(user,host,listing)
    @listing = listing
    @host = host
    @user = user
    @url  = "localhost:3000/listings/#{@listing.id}"
    mail(to: ENV['GMAIL_TEST'], subject: 'You got a new booking!')
  end
end