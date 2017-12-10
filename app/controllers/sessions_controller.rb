class SessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(name: params[:session][:name])
    logger.debug { "admin:" + admin.inspect }
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to signup_url
    else
      flash.now[:danger] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
