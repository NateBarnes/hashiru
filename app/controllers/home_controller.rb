class HomeController < ApplicationController
  def today
    if current_user
      #render today page
    else
      redirect_to new_user_path
    end
  end
end
