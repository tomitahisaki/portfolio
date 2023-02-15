class Country < ApplicationRecord
  has_many :plan_countries, dependent: :destroy
  has_many :plans, through: :plan_countries
end
