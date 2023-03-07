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
      countries = plan_params[:countries_attributes].values.map do |country_params| # フォームから送信された値のplan_paramsのcountry_attributesのハッシュの値(value)をmapメソッドで配列に変換し、countries変数に入れる。
                    Country.find_or_create_by(name: country_params[:name]) do |country| # Countryモデルから、country_params[:name]でフォームで受け 取った値があるか確認する。ある場合はfind_byとなる。ない場合は、createで新規作成と保存が行われる。
                      country.assign_attributes(country_params.except(:_destroy))
                    end
                  end

      countries.each do |country|
        set_info = Information.where("country_name LIKE ?", "%#{country.name}%")  # country.nameを渡して、country_nameに部分一致するものを取り出す。
        if set_info.present? && set_info.pluck(:country_id) == [nil]                  # set_infoに情報があり、かつcountry_id(外部キー)がない場合に以下の処理をする。
          set_info.update(country_id: country.id)                                 # 外部キーのcountry_idにcountry.idを入れて更新する。
        end
        binding.break
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
      countries_params = plan_params[:countries_attributes].values.reject{|country_params| country_params[:_destroy] != 'false'}
      countries = countries_params.map do |country_params| # フォームから送信された値のplan_paramsのcountry_attributesのハッシュの値(value)をmapメソッドで配列に変換し、countries変数に入れる。
                    Country.find_or_create_by(name: country_params[:name]) do |country| # Countryモデルから、country_params[:name]でフォームで受け取った値があるか確認する。ある場合はfind_byとなる。ない場合は、initializeで　新規作成が行われる。
                      country.assign_attributes(country_params.except(:_destroy))
                    end
                  end

      countries.each do |country|
        set_info = Information.where("country_name LIKE ?", "%#{country.name}%")
        if set_info.present? && set_info.pluck(:country_id) == nil
          set_info.update(country_id: country.id)
        end
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
