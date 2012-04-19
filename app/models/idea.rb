class Idea < ActiveRecord::Base
  attr_accessible :thought, :user_id

  belongs_to :user
end
