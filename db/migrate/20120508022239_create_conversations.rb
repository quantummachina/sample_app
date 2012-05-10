class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    	t.integer :user_id
    	t.integer :interlocutor_id

      t.timestamps
    end

    add_index :conversations, :user_id
    add_index :conversations, :interlocutor_id
    add_index :conversations, [:user_id, :interlocutor_id], unique: true
  end
end
