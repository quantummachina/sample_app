class Commenthrd < ActiveRecord::Base
  attr_accessible :comment, :thrd_id, :user_id

  belongs_to :thrd
  belongs_to :user
end
