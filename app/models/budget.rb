class Budget < ApplicationRecord
  belongs_to :plan_country
  has_many :budget_categories, dependent: :destroy
  has_many :categories, through: :budget_categories
end
