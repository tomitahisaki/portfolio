class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[new create show edit update destroy]
  
  def new
    @budget =Budget.new
  end

  def create
    @budget = @plans.budgets.new(budget_params)

    if @budget.save
      flash[:success] = '予算を登録しました'
      redirect_to budget_path
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
    @plan = Plan.find(params[:plan_id])
  end

  def budget_params
    params.require(:budget).permit(:amount, :name)
  end
end
