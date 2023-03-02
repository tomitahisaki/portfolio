# == Schema Information
#
# Table name: plans
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_plans_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :plan do
    name { "MyString" }
  end
end
