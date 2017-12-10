class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  def authenticate_user!
    redirect_to '/login' if current_admin.nil?
  end



  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

end
