class PlansController < ApplicationController
  def index
  end

  def new
    @plan = Plan.new
    @plan.countries.build
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path, notice: 'success'
    else
      flash.now[:alert] = 'failed'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def plan_params
    params.require(:plan).permit(:name, countries_attributes: [:name, :latitude, :longitude])
  end
end
