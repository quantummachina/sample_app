class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.string :thought, default: ""

      t.timestamps
    end
    add_index :ideas, [:user_id, :created_at]
  end
end
