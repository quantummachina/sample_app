class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.integer :project_id
      t.string :description
      t.boolean :got
      t.integer :type

      t.timestamps
    end

    add_index :needs, [:project_id, :created_at]
  end
end
