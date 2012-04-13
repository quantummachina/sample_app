class Need < ActiveRecord::Base
  attr_accessible :title, :description, :got, :project_id, :type

  belongs_to :project
end
