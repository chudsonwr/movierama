class UserNotifier < ActionMailer::Base
  default from: "no-reply@movieama.dev"

  layout "mailer"

  def send_notification_email(useremail, voter, movie)
    @user = useremail
    @voter = voter
    @movie = movie
    mail( :to => useremail,
    :subject => 'You have a new vote on one of your movies' )
  end
end
