class PlansController < ApplicationController
  before_action :set_plan, only: %i[edit update destroy]

  def index
    if params[:country_name]
      @country = Country.find_by(name: params[:country_name])
      @plans = @country.plans.includes(:user).order(created_at: :desc).page(params[:page]).per(6)
    else
      @plans = Plan.includes(:user).order(created_at: :desc).page(params[:page]).per(6)
    end
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

    if @plan.valid? && plan_params[:countries_attributes].present?
      #countryモデルに重複しないように登録する
      countries = Plan.find_or_create_countries(plan_params[:countries_attributes])
      #informationにcountry_idを紐つける処理
      Information.set_country_id(countries)
      #countriesにはcountryモデルからfind_or_createしたカラムを@plan.countriesに紐つけている。
      @plan.countries = countries

      if @plan.save
        flash[:success] = t('defaults.message.created', item: Plan.model_name.human)
        redirect_to plans_path, success: 'success'
      else
        @plan.countries.clear
        flash.now[:error] = t('defaults.message.not_created', item: Plan.model_name.human)
        render :new
      end
    else
      flash.now[:error] =[ t('defaults.message.not_created', item: Plan.model_name.human), t('defaults.message.add_country', item: Country.model_name.human) ].join(', ')
      render :new
    end
  end

  def update
    # countries_params = plan_params[:countries_attributes].select { |country_params| country_params[:_destroy] == 'false' }
    countries_params = plan_params[:countries_attributes].select { |_, params| params[:_destroy] == 'false' }
    #countryモデルに重複しないように登録する
    countries = Plan.find_or_create_countries(countries_params)
    #informationにcountry_idを紐つける処理
    Information.set_country_id(countries)

    @plan.countries = countries
    @plan.update(plan_params.except(:countries_attributes))

    if @plan.save
      flash[:success] = t('defaults.message.updated', item: Plan.model_name.human)
      redirect_to plan_path(@plan)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Plan.model_name.human)
      render :edit
    end
  end

  def destroy
    @plan.destroy!
    flash[:success] = t('defaults.message.deleted', item: Plan.model_name.human)
    redirect_to plans_path
  end

  private

  def set_plan
    @plan = current_user.plans.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :image, countries_attributes: %i[id name latitude longitude _destroy])
  end
end
