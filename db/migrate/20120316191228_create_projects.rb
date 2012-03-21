class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.integer :description
      t.string :cover

      t.timestamps
    end
    add_index :projects, [:user_id, :created_at]
  end
end
