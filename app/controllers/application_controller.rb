class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_login
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user.admin?
      flash[:danger] = "Invalid url."
      redirect_to root_url
    end
  end
end
