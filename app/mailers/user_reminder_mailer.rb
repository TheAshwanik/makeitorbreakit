class UserReminderMailer < ActionMailer::Base
  default :from => 'sarahrosepainting@gmail.com'

  def reminder
    @user = Array.new
    @goodhabits = Goodhabit.where(reminders: true)
    @badhabits = Badhabit.where(reminders: true)
    @goodhabits.each do |habit|
      @user.push(habit.user.email)
    end
    @badhabits.each do |habit|
      @user.push(habit.user.email)
    end
      @user.each do |email|
        from = SendGrid::Email.new(email: 'sarahrosepainting@gmail.com' )
        subject = 'Reminder'
        to = SendGrid::Email.new(email: email)
        content = SendGrid::Content.new(type: 'text/plain', value: "Do not forget to checkin this week!")
        mail = SendGrid::Mail.new(from, subject, to, content)
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
      end


  end


end
