class VisasController < ApplicationController
  before_action :set_visa

  def show
    #リファクタリングしたあと
    measure_text_param = params.keys.detect { |key| key.start_with?('measure_text') }
    measure_text = measure_text_param ? measure_text_param.to_sym : :measure_text2
  
    gon.countries = @countries
    @measure_text_title = Information.human_attribute_name(measure_text)
    gon.measure_text_title = @measure_text_title
    gon.country_information = @countries.map(&:information)
    gon.country_measure_text = @countries.map { |country| country.information[measure_text] }
  
    # if params[:measure_text3]
    #   binding.break
    #   gon.countries = @countries
    #   @measure_text_title = Information.human_attribute_name(:measure_text3)
    #   gon.measure_text_title = @measure_text_title
    #   gon.country_information = @countries.map(&:information)
    #   gon.country_measure_text = @countries.map {|country| country.information.measure_text3}
      
    # elsif params[:measure_text4]
    #   gon.countries = @countries
    #   @measure_text_title = Information.human_attribute_name(:measure_text4)
    #   gon.measure_text_title = @measure_text_title
    #   gon.country_information = @countries.map(&:information)
    #   gon.country_measure_text = @countries.map {|country| country.information.measure_text4}
      
    # elsif params[:measure_text2]
    #   gon.countries = @countries
    #   @measure_text_title = Information.human_attribute_name(:measure_text2)
    #   gon.measure_text_title = @measure_text_title
    #   gon.country_information = @countries.map(&:information)
    #   gon.country_measure_text = @countries.map {|country| country.information.measure_text2}
    # end
  end

  private
  
  def set_visa
    @plan_country = PlanCountry.find(params[:id])
    @plan = @plan_country.plan
    @countries = @plan.countries
  end

end
