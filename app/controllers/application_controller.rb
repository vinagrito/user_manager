class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :logged_admin
  
  def current_user
    @current_user ||= User.find_by_username(session[:username]) if session[:username]
  end
  
  def logged_admin
    current_user.roles.include?(Role.first)      
  end
  
end
