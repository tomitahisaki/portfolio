class PlansController < ApplicationController
  def index
  end

  def new
    @plan = Plan.new
    # @plan.countries.build # field_forを最初は非表示とするため、コメントアウト
  end

  def create
    @plan = Plan.new(plan_params)
    binding.pry
    if @plan
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
    params.require(:plan).permit(:name, countries_attributes: [:id, :name, :latitude, :longitude])
  end
end
