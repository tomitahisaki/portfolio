class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[new create show edit update destroy]
  
  def new
    @budgets = []
    @plan_countries.each do |plan_country|
      @countries.size.times do |i|
        @budgets << plan_country.budgets.build
      end
    end
  end

  def create
    #複数のplan_countryに紐付くbudgetを複数作成するための処理
    @budgets = []
    @plan_countries.each do |plan_country|
      @countries.size.times do |i|
        @budgets << plan_country.budgets.build(budget_params)
      end
    end

    if @budgets.all?(&:save)
      flash[:success] = '予算を登録しました'
      redirect_to budgets_path
    else
      flash.now[:error] = '予算の登録に失敗しました'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_budget
    @plan_countries = PlanCountry.by_plan_id(params[:id])
    @countries = @plan_countries.map{|plan_country| Country.find(plan_country.country_id)}
    @categories = Category.all
    binding.break
  end

  def budget_params
    params.require(:budget).permit(:amount, :description).merge(category_id: params[:category_id])
  end
end
