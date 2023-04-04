class ProfilesController < ApplicationController
  before_action :set_user

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = t('defaults.message.updated', item: User.model_name.human)
      redirect_to profile_path
    else
      flash.now[:error] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
    @plans = @user.plans.all
    @countries = @plans.map { |plan| plan.countries.map(&:name) }.flatten.uniq
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :avatar)
  end
end
