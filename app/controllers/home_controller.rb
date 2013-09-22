class HomeController < ApplicationController
  def today
    redirect_to new_user_path unless current_user
  end
end
