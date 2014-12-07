class CreateTaglines < ActiveRecord::Migration
  def change
    create_table :taglines do |t|
      t.integer :restaurant_id
      t.text :tagline

      t.timestamps
    end
  end
end
