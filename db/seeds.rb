# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# # 外務省スクレイピングデータ作成用
# require 'csv'
# CSV.foreach('db/csv/countries_data.csv', headers: true) do |row|
#   Information.create(
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

#初期データ作成
