class PlansController < ApplicationController
  before_action :set_plan, only: %i[edit update destroy]

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
    @countries = @plan.countries
    gon.countries = @countries
  end

  def new
    @plan = Plan.new
    # @plan.countries.build # field_forを最初は非表示とするため、コメントアウト
  end

  def edit
    gon.countries = @plan.countries
  end

  def create
    @plan = current_user.plans.new(plan_params)

    countries = plan_params[:countries_attributes].values.map do |country_params|
      Country.find_or_create_by(name: country_params[:name]) do |country|
        country.assign_attributes(country_params.except(:_destroy))
      end
    end

    countries.each do |country|
      set_info = Information.where(country_name: country.name)
      set_info = Information.where('country_name LIKE ?', "%#{country.name}%") if set_info.empty?
      set_info.update(country_id: country.id) if set_info.present? && set_info.pluck(:country_id) == [nil]
    end

    @plan.countries = countries
    if @plan.save
      redirect_to plans_path, success: 'success'
    else
      @plan.countries.clear
      flash.now[:error] = 'failed to build plan'
      render :new
    end
  end

  def update
    countries_params = plan_params[:countries_attributes].values.select { |country_params| country_params[:_destroy] == 'false' }
    countries = countries_params.map do |country_params|
      Country.find_or_create_by(name: country_params[:name]) do |country|
        country.assign_attributes(country_params.except(:_destroy))
      end
    end

    countries.each do |country|
      set_info = Information.where(country_name: country.name)
      set_info = Information.where('country_name LIKE ?', "%#{country.name}%") if set_info.empty?
      set_info.update(country_id: country.id) if set_info.present? && set_info.pluck(:country_id) == [nil]
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

  def destroy
    @plan.destroy!
    redirect_to plans_path, info: 'you succeed to destroy '
  end

  private

  def set_plan
    @plan = current_user.plans.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, countries_attributes: %i[id name latitude longitude _destroy])
  end
end
