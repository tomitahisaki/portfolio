class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
    # @plan.countries.build # field_forを最初は非表示とするため、コメントアウト
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to plans_path, notice: 'success'
    else
      flash.now[:alert] = 'failed'
      render :new
    end
  end

  def show
    @plan = Plan.find(params[:id])
    @countries = @plan.countries
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_plan
    @plan = current_user.plans.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, countries_attributes: [:id, :name, :latitude, :longitude])
  end
end
