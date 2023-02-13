class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user.save
      redirect_to root_path, notice: 'login success'
    else
      flash.now[:alert] = 'login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'logout'
  end
end
