class PlanCountriesController < ApplicationController
  def new
  end

  def create
  end

  def show
    @plan = Plan.find(params[:plan_id])
    @countries =  @plan.countries
    gon.countries = @countries
    gon.country_information= @countries.map{|country| country.information}
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
