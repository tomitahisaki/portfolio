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
FactoryBot.define do
  factory :country do
    name { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
