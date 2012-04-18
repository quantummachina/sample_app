class Need < ActiveRecord::Base
  attr_accessible :title, :description, :got, :project_id, :type, :reward, :anywhere, :place

  belongs_to :project
end
