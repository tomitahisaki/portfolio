# == Schema Information
#
# Table name: budget_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  budget_id   :bigint           not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_budget_categories_on_budget_id    (budget_id)
#  index_budget_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (budget_id => budgets.id)
#  fk_rails_...  (category_id => categories.id)
#
FactoryBot.define do
  factory :budget_category do
    budget { nil }
    category { nil }
  end
end
