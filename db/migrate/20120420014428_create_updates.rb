class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :project_id
      t.string :content, default: ""

      t.timestamps
    end

    add_index :updates, :project_id
  end
end
