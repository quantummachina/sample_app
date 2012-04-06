class CreateCollabs < ActiveRecord::Migration
  def change
    create_table :collabs do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end

    add_index :collabs, :project_id
    add_index :collabs, :user_id
    add_index :collabs, [:project_id, :user_id], unique: true
  end
end
