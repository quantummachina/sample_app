class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
    	t.integer :conversation_id
    	t.integer :user_id
    	t.text :text, default: ""
      t.timestamps
    end
  end
end
