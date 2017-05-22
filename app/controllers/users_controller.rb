class UsersController < ApplicationController
  before_action :authenticate_user!
  require 'sendgrid-ruby'


  def index

  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
    else
      flash[:alert] = "You do not have access to that page."
      redirect_to root_path
    end
    @goalcheckin = Goalcheckin.new
    # @checkins = Goalcheckin.where(user_id: params[:id].to_i)
  end

  def checkin
    @goalcheckin = Goalcheckin.new(goalcheckin_params)
    @goalcheckin.user_id = params[:user_id].to_i
    @goalcheckin.goodhabit_id = params[:id].to_i
    @goalcheckin.checkintime = DateTime.now
    if @goalcheckin.save
      respond_to do |format|
          format.js
      end
    else
      flash[:alert] = "There was a problem checking in."
      redirect_to :back
    end
  end

  # def reminder
  #   @user = Array.new
  #   @goodhabits = Goodhabit.where(reminders: true)
  #   @goodhabits.each do |habit|
  #     @user.push(habit.user.email)
  #   end
  #   # UserReminderMailer.email_reminder(@user).deliver
  #   if DateTime.now == Mon, 22 May 2017 12:14:00 -0400
  #     @user.each do |email|
  #       from = SendGrid::Email.new(email: 'sarahrosepainting' )
  #       subject = 'Reminder'
  #       to = SendGrid::Email.new(email: email)
  #       content = SendGrid::Content.new(type: 'text/plain', value: "Do not forget to checkin this week!")
  #       mail = SendGrid::Mail.new(from, subject, to, content)
  #       sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  #
  #       response = sg.client.mail._('send').post(request_body: mail.to_json)
  #       puts response.status_code
  #       puts response.body
  #     end
  #   else
  #
  #   end
  #
  # end



  private

  def goalcheckin_params
    params.require(:goalcheckin).permit(:status)
  end

end
