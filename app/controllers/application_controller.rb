class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  def current_user
    if session[:user_id] && User.find_by_id(session[:user_id])
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  def require_author
    redirect_to login_url unless current_user
  end

  def require_logged_out
    redirect_to root_url unless !current_user
  end
end