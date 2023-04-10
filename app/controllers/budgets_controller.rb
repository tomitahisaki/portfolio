class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[new create show edit update destroy]
  
  def new
    @budgets_form = Form::BudgetsForm.new
  end

  def create
    @budgets_form = Form::BudgetsForm.new(budgets_form_params)
    binding.break
    if @budgets_form.save
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
  end

  def budgets_form_params
    params.require(:form_budgets_form).permit(budgets_attributes: [:plan_country_id, :amount, :description, :category_id])
  end
end
