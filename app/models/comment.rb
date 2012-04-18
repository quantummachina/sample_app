class Comment < ActiveRecord::Base
  attr_accessible :project_id, :user_id, :content

  belongs_to :project
  belongs_to :user
  
end
