# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 外務省スクレイピングデータ作成用
require 'csv'

CSV.foreach('db/csv/countries_data.csv', headers: true) do |row|
  (country_name: country.name)
  # country = Country.find_by(name: "row['country_name']")  #外部キーをつける処理 一旦コメントアウト controlerでも同処理をしている
  # country = Country.find_by("name LIKE ?", "#{row['country_name']}") if country.empty?  #外部キーをつける処理 一旦コメントアウト controlerでも同処理をしている
  Information.create(
    # country_id: country ? country.id : nil,
    country_cd: row['country_cd'],
    country_name: row['country_name'],
    measure_url: row['measure_url'],
    measure_text2: row['measure_text2'],
    measure_text3: row['measure_text3'],
    measure_text4: row['measure_text4'],
    measure_text5: row['measure_text5'],
    measure_text6: row['measure_text6'],
  )
end

#初期データ作成
# 2.times do |n|
#   User.create!(
#     name: Faker::Name.name, 
#     email: Faker::Internet.email,
#     password: 'aaa',
#     password_confirmation: 'aaa'
#   )

# end

# 5.times do |n|
#   Plan.create!(
#     name: Faker::Name.first_name,
#     user: User.offset(rand(User.count)).first
#   )
# end

# 20.times do |n|
#   Country.create!(
#     name: Faker::Address.country,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude,
#   )
# end

# 20.times do |n|
#   PlanCountry.create!(
#   plan: Plan.offset(rand(Plan.count)).first,
#   country: Country.offset(rand(Country.count)).first
# )
# end
