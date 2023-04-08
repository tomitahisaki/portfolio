class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.integer :amount
      t.string :name
      t.references :plan_country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
