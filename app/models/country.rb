# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  latitude   :float            not null
#  longitude  :float            not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Country < ApplicationRecord
  has_many :plan_countries, dependent: :destroy
  has_many :plans, through: :plan_countries

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
