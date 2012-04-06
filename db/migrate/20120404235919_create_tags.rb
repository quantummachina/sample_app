class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :phrase

      t.timestamps
    end
        add_index :tags, :phrase, unique: true
  end

  
end
