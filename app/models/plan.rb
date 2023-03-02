# == Schema Information
#
# Table name: plans
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  name       :string
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
class Plan < ApplicationRecord
  belongs_to :user
  has_many :plan_countries, dependent: :destroy
  has_many :countries, through: :plan_countries

  accepts_nested_attributes_for :countries, allow_destroy: true
end
