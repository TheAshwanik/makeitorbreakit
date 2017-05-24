class BadhabitsController < ApplicationController
  before_action :authenticate_user!

  def new
    @badhabit = Badhabit.new
  end

  def create
    @badhabit = Badhabit.new(badhabit_params)
    @badhabit.user_id = current_user.id
    if @badhabit.save
      flash[:notice] = "Your habit has been made!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem creating your habit."
      render :new
    end
  end

  def edit
    @badhabit = Badhabit.find(params[:id].to_i)
    if @badhabit.user_id == current_user.id
    else
      flash[:alert] = "You do not have access to that page."
      redirect_to root_path
    end
  end

  def update
    @badhabit = Badhabit.find(params[:id].to_i)
    if @badhabit.update(badhabit_params)
      flash[:notice] = "Your habit has been updated."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem updating your habit."
      render :edit
    end
  end

  def destroy
    @badhabit = Badhabit.find(params[:id].to_i)
    if @badhabit.destroy
      flash[:notice] = "Your habit has been deleted."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem deleting you habit."
      render :edit
    end
  end

  # strong params
  private
  def badhabit_params
    params.require(:badhabit).permit(:badhabit, :description, :totalnumofdays, :reminders)
  end

end
