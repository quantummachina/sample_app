class ChangeColumnDescriptionInProjects < ActiveRecord::Migration
  def change
  	change_column(:projects, :description, :string)
  end
end
