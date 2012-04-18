class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :project_id
    add_index :likes, [:user_id, :project_id], unique: true
  end
end
