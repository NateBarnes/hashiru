class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login user
    cookies.signed[:user_id] = { value: user.id, expires: 20.years.from_now }
  end

  def current_user
    id = cookies.signed[:user_id]
    if id.present?
      User.find id
    else
      nil
    end
  end
  helper_method :current_user

  def logout
    cookies.delete :user_id
  end

end
