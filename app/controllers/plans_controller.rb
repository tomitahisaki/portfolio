class PlansController < ApplicationController

  before_action :set_plan, only: %i[edit update destroy]

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
    # @plan.countries.build # field_forを最初は非表示とするため、コメントアウト
  end

  def create
    @plan = current_user.plans.new(plan_params)
    
    @plan.transaction do
      country_names =  params[:plan][:countries_attributes].values.map{|country| country[:name]}# フォームから送信された値をattributeの名前を取得
      existing_countries = Country.where(name: country_names).to_a # countryモデルにある country_namesのオブジェクトを取得
      
      countries = plan_params[:countries_attributes].values.map do |country_params| #countries_attributesから Countryオブジェクトを生成。
        country = existing_countries.find{|country| country.name == country_params[:name]} # existing_countriesから、country_params[:name]と等しいnameを取得する

        if country.nil?  
          country = Country.new(country_params.except(:_destroy)) #countryがない場場合 新たに、countryオブジェクトを作成する。
        else
          country.assign_attributes(country_params.except(:_destroy)) #countryがあれば、country_params.except(:_destroy)で属性の変更のみ行う。
        end

        country
      end

      @plan.countries = countries


      if @plan.save
        redirect_to plans_path, success: 'success'
      else
        flash.now[:error] = 'failed to build plan'
        render :new
      end
    end
  end

  def show
    @plan = Plan.find(params[:id])
    @countries = @plan.countries
    gon.countries = @countries
  end

  def edit
    gon.countries = @plan.countries
  end

  def update

    @plan.transaction do
      country_names =  params[:plan][:countries_attributes].values.map{|country| country[:name]}# フォームから送信された値をattributeの名前を取得
      existing_countries = Country.where(name: country_names).to_a # countryモデルにある country_namesのオブジェクトを取得
      
      countries = plan_params[:countries_attributes].values.map do |country_params| #countries_attributesから Countryオブジェクトを生成。
        country = existing_countries.find{|country| country.name == country_params[:name]} # existing_countriesから、country_params[:name]と等しいnameを取得する
        if country.nil?  
          country = Country.new(country_params.except(:_destroy)) #countryがcontryモデルにない場合 新たに、countryオブジェクトを作成する。
        else
          country.assign_attributes(country_params.except(:_destroy)) #countryがcountryモデルにあれば、country_params.except(:_destroy)で属性の変更のみ行う。
        end
        country
      end

        @plan.countries.delete_all
        @plan.countries = countries

      if @plan.save
        flash[:success] = 'you succeed to update '
        redirect_to plan_path(@plan)
      else
        flash.now[:error]
        render :edit
      end
    end
  end

  def destroy
    @plan.destroy!
    redirect_to plans_path, info: 'you succeed to destroy '
  end

  private

  def set_plan
    @plan = current_user.plans.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, countries_attributes: [:id, :name, :latitude, :longitude ,:_destroy])
  end
end
