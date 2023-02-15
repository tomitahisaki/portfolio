class Country < ApplicationRecord
  has_many :plan_countries
  has_many :plans, dependent: :destroy
end
