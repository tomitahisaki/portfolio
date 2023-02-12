require "nokogiri"
require 'open-uri'

file = URI.open('https://www.ezairyu.mofa.go.jp/opendata/country/0970A.xml') #パレスチナが含まれていないので注意
xml_docs = Nokogiri::XML(file) # Nokogiri::XML::Document

country_cd = []
xml_docs.xpath('//country/cd').each do |xml_doc|  # Nokogiri::XML::NodeSet
  country_cd << xml_doc.text unless country_cd.include?(xml_doc.text)                    # Nokogiri::XML::Element
end
puts country_cd