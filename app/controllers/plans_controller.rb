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
    gon.countries = @countries
  end

  def edit; end

  def update
    if @plan.update!(plan_params)
      redirect_to plan_path(@plan), notice: 'you succeed to update'
    else
      flash.now[:alert] = 'failed'
      render :new
    end
  end

  def destroy
    @plan.destroy!
    redirect_to plans_path, notice: 'you succeed to destroy '
  end

  private

  def set_plan
    @plan = current_user.plans.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, countries_attributes: [:id, :name, :latitude, :longitude])
  end
end
