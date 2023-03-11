class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    
    if @user
      flash[:success] = 'successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'login failed'
      render :new
    end
  end

  def destroy
    logout
    flash[:info] = 'successfully logout'
    redirect_to root_path
  end
end
