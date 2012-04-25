class CreateThrds < ActiveRecord::Migration
  def change
    create_table :thrds do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :title, default: ""
      t.string :content, default: ""

      t.timestamps
    end

    add_index :thrds, :project_id
    add_index :thrds, :user_id
  end
end
