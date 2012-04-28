class IncludeLikesCountInProject < ActiveRecord::Migration
  def up
  	add_column :projects, :likes_count, :integer, default: 0
  end

  def down
  end
end
