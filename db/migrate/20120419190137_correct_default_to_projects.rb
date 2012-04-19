class CorrectDefaultToProjects < ActiveRecord::Migration
  def up
  	change_column :projects, :category_id, :integer, default: 1
  end

  def down
  end
end
