class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :description, default: ""
      t.integer :responsible
      t.date :deadline

      t.timestamps
    end
    add_index :tasks, :project_id
  end
end
