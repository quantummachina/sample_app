class Update < ActiveRecord::Base
  attr_accessible :content, :project_id, :user_id

  belongs_to :project
  belongs_to :user

  default_scope order: 'updates.created_at DESC'
end
