class PlanCountriesController < ApplicationController
  def show
    @plan = Plan.find(params[:plan_id])
    @countries =  @plan.countries
    gon.countries = @countries
    gon.country_information = @countries.map(&:information)
  end
end
