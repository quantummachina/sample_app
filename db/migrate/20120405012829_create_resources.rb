class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :filename
      t.integer :project_id

      t.timestamps
    end

    add_index :resources, :project_id
    
  end

  
end
