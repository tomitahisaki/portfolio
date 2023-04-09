class AddReferencesToBudget < ActiveRecord::Migration[7.0]
  def change
    add_reference :budgets, :category, null: false, foreign_key: true
  end
end
