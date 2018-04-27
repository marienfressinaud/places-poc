class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :description
      t.string :address_line1
      t.string :address_zip
      t.string :address_city

      t.timestamps
    end
  end
end
