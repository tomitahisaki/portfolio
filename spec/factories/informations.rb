# == Schema Information
#
# Table name: informations
#
#  id            :bigint           not null, primary key
#  country_cd    :integer
#  country_name  :string
#  measure_text2 :text
#  measure_text3 :text
#  measure_text4 :text
#  measure_text5 :text
#  measure_text6 :text
#  measure_url   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  country_id    :bigint
#
# Indexes
#
#  index_informations_on_country_id  (country_id)
#
# Foreign Keys
#
#  fk_rails_...  (country_id => countries.id)
#
FactoryBot.define do
  factory :information do
  end
end
