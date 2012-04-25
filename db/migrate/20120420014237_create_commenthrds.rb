class CreateCommenthrds < ActiveRecord::Migration
  def change
    create_table :commenthrds do |t|
      t.integer :thrd_id
      t.integer :user_id
      t.string :comment, default: ""

      t.timestamps
    end
    add_index :commenthrds, :thrd_id 
  end
end
