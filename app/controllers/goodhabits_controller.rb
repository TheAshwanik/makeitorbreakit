class GoodhabitsController < ApplicationController
  before_action :authenticate_user!

  def new
    @goodhabit = Goodhabit.new
  end

  def create
    @goodhabit = Goodhabit.new(goodhabit_params)
    @goodhabit.user_id = current_user.id
    if @goodhabit.save
      flash[:notice] = "Your habit has been made!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem creating your habit."
      render :new
    end
  end

  # strong params
  private
  def goodhabit_params
    params.require(:goodhabit).permit(:goodhabit, :description, :timesperweek, :reminders)
  end

end
