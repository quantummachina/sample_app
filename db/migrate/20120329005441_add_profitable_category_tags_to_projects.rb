class AddProfitableCategoryTagsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :profitable, :boolean

    add_column :projects, :category, :integer

    add_column :projects, :tags, :string

  	add_index :projects, :category
  	add_index :projects, :profitable
  end
end
