class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.integer :user_id
      t.integer :report_id

      t.timestamps
    end
  end
end
