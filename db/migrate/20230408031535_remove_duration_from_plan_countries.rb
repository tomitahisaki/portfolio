class RemoveDurationFromPlanCountries < ActiveRecord::Migration[7.0]
  def change
    remove_column :plan_countries, :duration, :integer
  end
end
