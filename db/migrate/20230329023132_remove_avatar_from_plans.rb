class RemoveAvatarFromPlans < ActiveRecord::Migration[7.0]
  def change
    remove_column :plans, :avatar, :string
  end
end
