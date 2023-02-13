class CreateInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :informations do |t|
      t.integer :country_area_cd
      t.integer :country_cd
      t.string :country_name
      t.string :measure_url
      t.text :measure_lead
      t.text :measure_subtext
      t.text :measure_main1
      t.text :measure_main2
      t.text :measure_main3
      t.text :measure_main4
      t.text :measure_main5
      t.text :measure_main6
      
      t.timestamps
    end
  end
end
