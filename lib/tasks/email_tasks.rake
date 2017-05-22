desc 'send reminder email'
task send_reminder_email: :environment do
  UserReminderMailer.reminder.deliver!

end
