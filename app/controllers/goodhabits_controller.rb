class GoodhabitsController < ApplicationController
  before_action :authenticate_user!

  def new
    @goodhabit = Goodhabit.new
  end

  def create
    @goodhabit = Goodhabit.new(goodhabit_params)
    @goodhabit.user_id = current_user.id
    if @goodhabit.save
      # @user = User.find(@goodhabit.user_id)
      # from = SendGrid::Email.new(email: 'sarahrosepainting@gmail.com' )
      # subject = 'hey'
      # to = SendGrid::Email.new(email: @user.email)
      # content = SendGrid::Content.new(type: 'text/plain', value: "did it work?")
      # mail = SendGrid::Mail.new(from, subject, to, content)
      # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      #
      # response = sg.client.mail._('send').post(request_body: mail.to_json)
      # puts response.status_code
      # puts response.body
      # # UserReminderMailer.email_reminder(@user).deliver
      flash[:notice] = "Your habit has been made!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem creating your habit."
      render :new
    end
  end

  def edit
    @goodhabit = Goodhabit.find(params[:id].to_i)
    if @goodhabit.user_id == current_user.id
    else
      flash[:alert] = "You do not have access to that page."
      redirect_to root_path
    end
  end

  def update
    @goodhabit = Goodhabit.find(params[:id].to_i)
    if @goodhabit.update(goodhabit_params)
      flash[:notice] = "Your habit has been updated."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem updating your habit."
      render :edit
    end
  end

  def destroy
    @goodhabit = Goodhabit.find(params[:id].to_i)
    if @goodhabit.destroy
      flash[:notice] = "Your habit has been deleted."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem deleting you habit."
      render :edit
    end
  end

  # strong params
  private
  def goodhabit_params
    params.require(:goodhabit).permit(:goodhabit, :description, :timesperweek, :reminders)
  end

end
