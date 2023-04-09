# == Schema Information
#
# Table name: budgets
#
#  id              :bigint           not null, primary key
#  amount          :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :bigint           not null
#  plan_country_id :bigint           not null
#
# Indexes
#
#  index_budgets_on_category_id      (category_id)
#  index_budgets_on_plan_country_id  (plan_country_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (plan_country_id => plan_countries.id)
#
FactoryBot.define do
  factory :budget do
    amount { 1 }
    name { "MyString" }
    plan_country { nil }
  end
end
