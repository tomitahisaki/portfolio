require "nokogiri"
require 'open-uri'
require 'csv'

#国コード(country_cd)を取得するための式
file = URI.open('https://www.ezairyu.mofa.go.jp/opendata/country/0970A.xml') #パレスチナが含まれていないので、パレスチナのCdとした
xml_docs = Nokogiri::XML(file) # Nokogiri::XML::Document
country_cds = []
xml_docs.xpath('//country/cd').each do |xml_doc|  # Nokogiri::XML::NodeSet
  country_cds << xml_doc.text unless country_cds.include?(xml_doc.text)                    # Nokogiri::XML::Element　　country_cdsは各タグごとにあるので、重複を避けるために unlessで省く
end
# p country_cds.size # 207カ国　確認

# タイトル行を用意
header = ['country_cd', 'country_name','measure_url', 'measure_text2', 'measure_text3', 'measure_text4', 'measure_text5', 'measure_text6']
rows = []
rows << header

country_cds.each do |country_cd|
  #各国へのドキュメントアクセス
  file = URI.open("https://www.ezairyu.mofa.go.jp/opendata/country/#{country_cd}A.xml")
  docs = Nokogiri::XML(file) # Nokogiri::XML::Document
  
#   # データの取得
  country_cd = docs.at('country cd').text
  country_name = docs.at('country name').text
  measure_url = docs.at('safetyMeasureUrl').text
  measure_text2 = docs.at('safetyMeasureMainText2').text
  measure_text3 = docs.at('safetyMeasureMainText3').text
  measure_text4 = docs.at('safetyMeasureMainText4').text
  measure_text5 = docs.at('safetyMeasureMainText5').text
  measure_text6 = docs.at('safetyMeasureMainText6').text
  
  rows << [country_cd, country_name, measure_url, measure_text2, measure_text3, measure_text4, measure_text5, measure_text6]
end

CSV.open("./csv/countries_data.csv","w") do |csv|
  rows.each do |row|
    csv << row
  end
end
