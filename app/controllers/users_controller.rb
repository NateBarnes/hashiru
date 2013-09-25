class UsersController < ApplicationController
  def new
    redirect_to today_path and return
    #redirect_to today_path if current_user
    #@user = User.new
  end

  def create
    @user = User.new user_params
    @user.save_mile_time_with_minutes_and_seconds params[:user][:mile_time_minutes], params[:user][:mile_time_seconds]

    if @user.save
      login @user
      redirect_to today_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :gender, :longest_distance, :goal_type
  end

end
