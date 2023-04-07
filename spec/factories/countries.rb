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
    name { Faker::Address.country}
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
