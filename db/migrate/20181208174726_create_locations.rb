class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :district
      t.string :post_code
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
