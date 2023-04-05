class ApplicationController < ActionController::Base
  before_action :require_login

  def not_authenticated
    redirect_to login_path
    flash[:error] = t('defaults.message.require_login')
  end
end
