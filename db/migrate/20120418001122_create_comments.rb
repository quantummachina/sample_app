class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, [:project_id, :created_at]
  end
end
