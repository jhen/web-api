class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
