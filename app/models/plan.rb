class Plan < ApplicationRecord
   has_many :countries, through: :plan_countries
   has_many :plan_countries, dependent: :destroy
end
