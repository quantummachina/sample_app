class CreateTagRels < ActiveRecord::Migration
  def change
    create_table :tag_rels do |t|
      t.integer :project_id
      t.integer :tag_id

      t.timestamps
    end

    add_index :tag_rels, :project_id
    add_index :tag_rels, :tag_id
    add_index :tag_rels, [:project_id, :tag_id], unique: true
  end
end
