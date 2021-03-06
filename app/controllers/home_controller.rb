class HomeController < ApplicationController
  def today
    render 'apology' and return
  end

  def search
    @events = ACTV.events current_user.search_goal, lat_lon: cookies[:location], radius: 25, per_page: 8, start_date: "#{2.months.from_now.strftime('%Y-%m-%d')}.."
  end

  def save_event
    current_user.event = Event.create params.require(:event).permit :name, :location, :date, :asset_guid
    current_user.save!
    redirect_to root_path
  end

  def logout
    super
    redirect_to root_path
  end

end
