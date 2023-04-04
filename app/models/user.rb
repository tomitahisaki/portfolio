# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string
#  email            :string           not null
#  introduction     :text
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :plans, dependent: :destroy
  has_one_attached :avatar

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 200 }

  validate :avatar_size
  validate :avatar_file

  def own?(object)
    id == object.user.id
  end

  private

  def avatar_size
    return unless avatar.present? && avatar.blob.byte_size > 10.megabytes

    errors.add(:avatar, 'は 10MB 以下のファイルを選択してください')
  end

  def avatar_file
    return unless avatar.present? && !avatar.blob.content_type.in?(%('image/jpeg image/png'))

    errors.add(:avatar, 'はJPEGまたはPNG形式のみ選択してください')
  end
end
