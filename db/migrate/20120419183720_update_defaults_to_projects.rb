class UpdateDefaultsToProjects < ActiveRecord::Migration
  def up
  	change_column :projects, :cover, :string, default: ""
  	change_column :projects, :profitable, :boolean, default: false
  	change_column :projects, :category_id, :integer, default: 0
  	change_column :projects, :tags, :string, default: ""
  	change_column :projects, :place, :string, default: ""
  end

  def down
  end
end
