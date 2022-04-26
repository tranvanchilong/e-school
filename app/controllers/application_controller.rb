class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  include SessionsHelper

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

   def correct_user
    @user = User.find(session[:user_id])
    @exam = Exam.find(session[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
