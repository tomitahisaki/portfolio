class PlanCountriesController < ApplicationController
  def new
  end

  def create
  end

  def show
    @plan = Plan.find(params[:plan_id])
    @countries =  @plan.countries
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
