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
FactoryBot.define do
  factory :budget do
    amount { 1 }
    name { "MyString" }
    plan_country { nil }
  end
end
