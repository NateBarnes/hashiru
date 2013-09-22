class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to today_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :gender, :mile_time, :longest_distance, :goal_type
  end

end
