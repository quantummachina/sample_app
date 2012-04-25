class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :project_id, :responsible, :user_id, :done

  belongs_to :project
  belongs_to :user, foreign_key: :responsible
end
