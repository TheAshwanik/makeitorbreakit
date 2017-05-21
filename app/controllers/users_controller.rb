class UsersController < ApplicationController
  before_action :authenticate_user!

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
      flash[:notice] = "You have checked in."
      redirect_to root_path
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
