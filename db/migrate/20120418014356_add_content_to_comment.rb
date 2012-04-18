class AddContentToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :content, :string, default: ""
  end
end
