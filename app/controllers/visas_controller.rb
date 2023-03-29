class VisasController < ApplicationController
  def show
    @plan_country = PlanCountry.find(params[:id])
    @plan = @plan_country.plan
    @countries =  @plan.countries
    gon.countries = @countries
    gon.country_information = @countries.map(&:information)
    gon.measure_text2 = I18n.t('activerecord.attributes.information.measure_text2')

  end
end
