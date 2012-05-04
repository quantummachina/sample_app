class CreateInspirations < ActiveRecord::Migration
  def change
  	create_table :inspirations do |t|
  		t.string :content, default: ""
  		t.text :content_html, default: ""
  		t.integer :user_id

      t.timestamps
  	end

    add_index :inspirations, [:user_id, :created_at]
  end

end
