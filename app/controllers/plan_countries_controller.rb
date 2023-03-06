class PlanCountriesController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def edit
    @plan = current_user.plans.find(params[:plan_id])
    @countries =  @plan.countries
    @plan_country = PlanCountry.find(params[:plan_id, :country_id])
  end

  def update
  end

  def destroy
  end
end
