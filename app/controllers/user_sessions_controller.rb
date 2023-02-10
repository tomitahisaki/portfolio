class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect to: root_path, notice: 'login success'
    else
      flash.now[:alert] = 'login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect to: root_path, notice: 'logout'
  end
end
