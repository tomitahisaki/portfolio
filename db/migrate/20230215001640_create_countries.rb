class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name, null: false, unique: true
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
