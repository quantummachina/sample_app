class Project < ActiveRecord::Base
	attr_accessible :name, :description, :cover, :profitable, :category, :tags

	belongs_to:user

	validates :name, presence: true #lenght: { maximum: 50}
	validates :user_id, presence: true
	#validates :description, lenght: { maximum: 500}

	default_scope order: 'projects.created_at DESC'
end
