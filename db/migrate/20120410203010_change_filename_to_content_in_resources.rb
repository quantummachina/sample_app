class ChangeFilenameToContentInResources < ActiveRecord::Migration
  def up
  	rename_column(:resources, :filename, :content)
  	add_column :resources, :content_html, :string, default: ""
  end

  def down
  end
end
