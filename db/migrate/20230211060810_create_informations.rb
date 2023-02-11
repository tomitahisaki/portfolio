class CreateInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :informations do |t|

      t.timestamps
    end
  end
end
