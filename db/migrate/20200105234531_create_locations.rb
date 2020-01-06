class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, required: true
      t.string :coordinates_decimal_degrees, required: true
    end
  end
end
