# == Schema Information
#
# Table name: plans
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_plans_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Plan < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :plan_countries, dependent: :destroy
  has_many :countries, through: :plan_countries

  accepts_nested_attributes_for :countries, allow_destroy: true
  validates_associated :countries

  validates :name, presence: true

  validate :image_file
  validate :image_size

  def image_file
    return unless image.present? && !image.blob.content_type.in?(%('image/jpeg image/png'))

    errors.add(:image, 'は JPEG 形式または PNG 形式のみ選択してください')
  end

  def image_size
    return unless image.present? && image.blob.byte_size > 10.megabytes

    errors.add(:image, 'は 10MB 以下のファイルを選択してください')
  end

  def self.find_or_create_countries(countries_params)
    countries_params.values.map do |country_params|
      Country.find_or_create_by(name: country_params[:name]) do |country|
        country.assign_attributes(country_params.except(:_destroy))
      end
    end
  end
end
