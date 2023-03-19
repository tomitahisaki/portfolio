class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      flash[:success] = 'successfully login'
      redirect_to new_plan_path
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

  def guest_login
    if current_user
      flash[:error] = 'you already login'
      redirect to new_plan_path
    else
      random_value = SecureRandom.hex
      @user = User.create!(name: 'Guest User', email: "test_#{random_value}@example.com", password: random_value.to_s, password_confirmation: random_value.to_s)
      auto_login(@user)
      flash[:success] = 'successfully login as guest'
      redirect_to root_path
    end
  end
end
