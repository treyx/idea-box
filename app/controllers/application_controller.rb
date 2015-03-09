class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path, :alert => exception.message
  end

  def redirect_unless_current_user_admin
    flash[:invalid_user] = "You are not authorized to access this page."
    redirect_to login_path unless current_user.admin? 
  end
end
