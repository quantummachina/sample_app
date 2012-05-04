class ChangeContentToResources < ActiveRecord::Migration
  def up
  	change_column :resources, :content_html, :text, default: ""
  end

  def down
  end
end
