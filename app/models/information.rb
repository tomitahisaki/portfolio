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
class Information < ApplicationRecord
  belongs_to :country, optional: true

  # 完全一致
  scope :by_country_name, ->(country_name) { where(country_name: country_name) }
  # 部分一致
  scope :country_name_like, ->(country_name) { where("country_name LIKE ?", "%#{country_name}%") }

  # informationにcountry_idを紐つける処理
  def self.set_country_id(countries)
    countries.each do |country|
      country_info = case country.name
                     when "アメリカ合衆国"
                       Information.where(country_cd: 1000)
                     when "アメリカ領サモア"
                       Information.where(country_cd: 1684)
                     when "サモア"
                       Information.where(country_cd: 685)
                     when "ドミニカ"
                       Information.where(country_cd: 767)
                     when "コンゴ"
                       Information.where(country_cd: 242)
                     else
                       Information.by_country_name(country.name).presence || Information.country_name_like(country.name)
                     end
      country_info.update(country_id: country.id) if country_id_not_set?(country_info)
    end
  end

  # informationからとってきたcountry_infoの存在とcountry_idがあるかを確認
  def self.country_id_not_set?(country_info)
    country_info.present? && country_info.pluck(:country_id) == [nil]
  end
end
