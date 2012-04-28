class Like < ActiveRecord::Base
  attr_accessible :user_id, :project_id

  belongs_to :user
  belongs_to :project, counter_cache: :likes_count

end
