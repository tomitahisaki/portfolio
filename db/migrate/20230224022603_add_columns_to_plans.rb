class AddColumnsToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :avatar, :string
    add_reference :plans, :user, null: false, foreign_key: true
  end
end
