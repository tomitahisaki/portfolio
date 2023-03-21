class ProfilesController < ApplicationController
  before_action :set_user

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success:'successfully update profile'
    else
      flash.now[:error] = 'fail to update profile'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
    @plans = @user.plans.all
    @countries = @plans.map { |plan| plan.countries.map { |country| country.name } }.flatten.uniq
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :avatar, :avatar_cash )
  end
end
