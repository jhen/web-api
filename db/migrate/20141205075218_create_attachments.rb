class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachable_type
      t.integer :attachable_id
      t.integer :user_id
      t.string :attachment

      t.timestamps
    end

    add_index :attachments, :attachable_type
    add_index :attachments, :attachable_id
    add_index :attachments, :user_id
  end
end
