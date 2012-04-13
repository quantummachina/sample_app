class AddTitleToNeeds < ActiveRecord::Migration
  def change
  	add_column :needs, :title, :string
  end
end
