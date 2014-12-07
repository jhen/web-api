class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :point_type
      t.integer :point

      t.timestamps
    end
  end
end
