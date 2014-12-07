class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.string :longitude
      t.string :latitude
      t.boolean :premium

      t.timestamps
    end
  end
end
