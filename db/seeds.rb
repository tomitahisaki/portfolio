# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 外務省スクレイピングデータ作成用
# require 'csv'

# CSV.foreach('db/csv/countries_data.csv', headers: true) do |row|
#   # country = Country.find_by(name: "row['country_name']")  #外部キーをつける処理 一旦コメントアウト controllerでも同処理をしている
#   # country = Country.find_by("name LIKE ?", "#{row['country_name']}") if country.empty?  #外部キーをつける処理 一旦コメントアウト controllerでも同処理をしている
#   Information.create(
#     # country_id: country ? country.id : nil,
#     country_cd: row['country_cd'],
#     country_name: row['country_name'],
#     measure_url: row['measure_url'],
#     measure_text2: row['measure_text2'],
#     measure_text3: row['measure_text3'],
#     measure_text4: row['measure_text4'],
#     measure_text5: row['measure_text5'],
#     measure_text6: row['measure_text6'],
#   )
# end

# 2回目以降のスクレイピングデータを作成する場合は、以下のコマンドを実行する csvファイルは、db/csv/countries_data.csvに保存する
# country_idは更新しない。country_cdがinformationテーブルから見つかれば、その他のカラムの情報を更新する

CSV.foreach('db/csv/countries_data.csv', headers: true) do |row|
  country_info = Information.find_by(country_cd: row['country_cd'])
  if country_info.present?
    country_info.update(
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
end


# # カテゴリーテーブルを作成するためのシードデータ
# Category.create(name: "食事")
# Category.create(name: "交通")
# Category.create(name: "宿泊")
# Category.create(name: "観光")
# Category.create(name: "その他")
