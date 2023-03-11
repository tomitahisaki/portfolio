class CreateInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :informations do |t|
      t.references :country, foreign_key: true
      t.integer :country_cd
      t.string :country_name
      t.string :measure_url
      t.text :measure_text2
      t.text :measure_text3
      t.text :measure_text4
      t.text :measure_text5
      t.text :measure_text6

      t.timestamps
    end
  end
end
