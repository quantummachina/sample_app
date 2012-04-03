class ChangeCategoryToCategoryId < ActiveRecord::Migration
  def up
  	rename_column(:projects, :category, :category_id)
  end

  def down
  end
end
