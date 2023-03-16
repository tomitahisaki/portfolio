class PlanCountriesController < ApplicationController
  def show
    @plan = Plan.find(params[:plan_id])
    @countries =  @plan.countries
    gon.countries = @countries
    gon.country_information = @countries.map(&:information)
    gon.measure_text2 = I18n.t('activerecord.attributes.information.measure_text2')
  end
end
