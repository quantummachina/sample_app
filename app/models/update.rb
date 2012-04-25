class Update < ActiveRecord::Base
  attr_accessible :content, :project_id

  belongs_to :project

  default_scope order: 'updates.created_at DESC'
end
