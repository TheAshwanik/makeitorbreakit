class UserReminderMailer < ActionMailer::Base
  default :from => 'sarahrosepainting@gmail.com'

  # send a reminder email to the user, pass in the user object that contains the user's email address
  def email_reminder(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Reminder' )
  end
end
