class HomeController < ApplicationController
  def index
    @user = User.new
    # if logged in
    #   redirect to choose
    # else
    #   redirect to register
  end

  def register
    
  end

  def choose
    
  end

end
