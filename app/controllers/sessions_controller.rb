class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate params[:session][:password]
      login user
    else
      flash.now[:danger] = t "flash.invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def login(user)
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    # redirect_back_or user
    if logged_in? && current_user.user?
    redirect_to root_url
    else 
    redirect_to :controller => 'static_pages', :action => 'home'
    end
  end
end
