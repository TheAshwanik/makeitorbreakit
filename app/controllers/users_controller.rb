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


  private

  def goalcheckin_params
    params.require(:goalcheckin).permit(:status)
  end

end
