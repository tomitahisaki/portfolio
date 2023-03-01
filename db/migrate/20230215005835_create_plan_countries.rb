class CreatePlanCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_countries do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
    add_index :plan_countries, [:plan_id, :country_id], unique: true
  end
end
