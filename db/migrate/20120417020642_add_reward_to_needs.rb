class AddRewardToNeeds < ActiveRecord::Migration
  def change
  	add_column :needs, :reward, :string, default: ""
  	add_column :needs, :place, :string, default: ""
  	add_column :needs, :anywhere, :boolean, default: true
  end
end
