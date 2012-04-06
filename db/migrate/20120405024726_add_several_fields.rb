class AddSeveralFields < ActiveRecord::Migration
  def up
  	add_column :users, :place, :string
  	add_column :users, :webpage, :string
  	add_column :users, :whatido, :string

  	add_column :projects, :online, :boolean, default: true
  	add_column :projects, :place, :string
  	add_column :projects, :finished, :boolean, default: false

add_index :tags, :phrase, unique: true
  end

  def down
  end
end
