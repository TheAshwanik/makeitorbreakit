class UsersController < ApplicationController
  before_action :authenticate_user!
  require 'sendgrid-ruby'


  def index
    @goodhabits = Goodhabit.all
    @badhabits = Badhabit.all
  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
    else
      flash[:alert] = "You do not have access to that page."
      redirect_to root_path
    end
    @goalcheckin = Goalcheckin.new
    @badhabitcheckin = Badhabitcheckin.new
    @today = Date.today
  end

  def checkin
    @goalcheckin = Goalcheckin.new(goalcheckin_params)
    @goalcheckin.user_id = params[:user_id].to_i
    @goalcheckin.goodhabit_id = params[:id].to_i
    @goalcheckin.checkintime = DateTime.now
    if @goalcheckin.save
      @habitid = params[:id].to_i
      respond_to do |format|
          format.js
      end
    else
      flash[:alert] = "There was a problem checking in."
      redirect_to :back
    end
  end

  def badcheckin
    @badhabitcheckin = Badhabitcheckin.new(badhabitcheckin_params)
    @badhabitcheckin.user_id = params[:user_id].to_i
    @badhabitcheckin.badhabit_id = params[:id].to_i
    @badhabitcheckin.checkintime = DateTime.now
    if @badhabitcheckin.save
      @habitid = params[:id].to_i
      respond_to do |format|
          format.js
      end
    else
      flash[:alert] = "There was a problem checking in."
      redirect_to :back
    end
  end


  private

  def goalcheckin_params
    params.require(:goalcheckin).permit(:status)
  end

  def badhabitcheckin_params
    params.require(:badhabitcheckin).permit(:status)
  end

end
