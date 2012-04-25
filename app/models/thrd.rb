class Thrd < ActiveRecord::Base
  attr_accessible :content, :project_id, :title, :user_id

  belongs_to :project
  belongs_to :user

  has_many :commenthrds
  default_scope order: 'thrds.created_at DESC'
end
