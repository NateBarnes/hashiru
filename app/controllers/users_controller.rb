class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit :name, :gender)
   
    if @user.save
      redirect_to today_path
    else
      render :new
    end

  end

end
