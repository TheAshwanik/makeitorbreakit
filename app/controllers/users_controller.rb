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
      @habit = Goodhabit.find(params[:id].to_i)
      @today = Date.today
      @checkray = Array.new
      @habit.goalcheckins.each do |checkin|
        if checkin.checkintime - 4.hours >= @today.monday
          @checkray.push(checkin.checkintime)
        else
        end
      end
      puts @checkray.length
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
      @habit = Badhabit.find(params[:id].to_i)
      @badcheckray = Array.new
      @habit.badhabitcheckins.each do |checkin|
        @badcheckray.push(checkin.checkintime)
      end
      respond_to do |format|
          format.js
      end
    else
      flash[:alert] = "There was a problem checking in."
      redirect_to :back
    end
  end

  def calendar
    @goodhabit = Goodhabit.find(params[:id])
    @checkins = @goodhabit.goalcheckins
  end


  private

  def goalcheckin_params
    params.require(:goalcheckin).permit(:status)
  end

  def badhabitcheckin_params
    params.require(:badhabitcheckin).permit(:status)
  end

end