class Plan < ApplicationRecord
  has_many :plan_countries, dependent: :destroy
  has_many :countries, through: :plan_countries

  accepts_nested_attributes_for :countries, allow_destroy: true
end
