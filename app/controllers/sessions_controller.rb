class SessionsController < ApplicationController
    
  before_filter :logged_admin,:except => ['new','create']
  def new
  end

  def create
    @user = User.authenticate(params[:username],params[:password])
    
    if @user && @user.admin?      
      session[:username] = @user.username
      flash[:notice] = "Welcome " + session[:username].to_s
      redirect_to users_path
    else
      if @user.admin?
        flash[:notice] = "Invalid email or password!."
      else
        flash[:notice] = "You have no rights to access this page!."
      end
      render 'new'
    end
  end

  def logout
    session[:username] = nil
    flash[:notice] = "You have logged out!."
    redirect_to log_in_path
  end
end
