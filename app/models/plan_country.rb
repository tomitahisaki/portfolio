class PlanCountry < ApplicationRecord
  belongs_to :plan
  belongs_to :country
end
