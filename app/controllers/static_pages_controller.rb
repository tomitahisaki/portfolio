class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top term policy contact]

  def top; end

  def term; end

  def policy; end

  def contact; end
end
