class VisasController < ApplicationController
  before_action :set_visa

  def show
    if params[:measure_text3]
      gon.countries = @countries
      @measure_text_title = I18n.t('activerecord.attributes.information.measure_text3')
      gon.country_information = @countries.map(&:information)
      gon.country_measure_text = @countries.map {|country| country.information.measure_text3}
      gon.measure_text_title = I18n.t('activerecord.attributes.information.measure_text3')
      
    elsif params[:measure_text4]
      gon.countries = @countries
      @measure_text_title = I18n.t('activerecord.attributes.information.measure_text4')
      gon.country_information = @countries.map(&:information)
      gon.country_measure_text = @countries.map {|country| country.information.measure_text4}
      gon.measure_text_title = I18n.t('activerecord.attributes.information.measure_text4')
      
    else
      gon.countries = @countries
      @measure_text_title = I18n.t('activerecord.attributes.information.measure_text2')
      gon.country_information = @countries.map(&:information)
      gon.country_measure_text = @countries.map {|country| country.information.measure_text2}
      gon.measure_text_title = I18n.t('activerecord.attributes.information.measure_text2')
    end
  end

  private
  
  def set_visa
    @plan_country = PlanCountry.find(params[:id])
    @plan = @plan_country.plan
    @countries =  @plan.countries
  end

end
