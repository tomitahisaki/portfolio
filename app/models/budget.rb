# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plan_id    :bigint           not null
#
# Indexes
#
#  index_budgets_on_plan_id  (plan_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_id => plans.id)
#
class Budget < ApplicationRecord
  belongs_to :plan_country
  has_many :budget_categories, dependent: :destroy
  has_many :categories, through: :budget_categories
end
