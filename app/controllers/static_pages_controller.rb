class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top contact term policy]

  def top; end

  def contact; end

  def term; end

  def policy; end
  
end
