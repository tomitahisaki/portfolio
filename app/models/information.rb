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
#
class Information < ApplicationRecord
end
