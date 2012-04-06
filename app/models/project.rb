class Project < ActiveRecord::Base
	attr_accessible :name, :description, :cover, :profitable, :category_id , :tags, :online, :place, :finished

	belongs_to :user

	belongs_to :category

	validates :name, presence: true #lenght: { maximum: 50}
	validates :user_id, presence: true
	#validates :description, lenght: { maximum: 500}

	has_many :collabs, dependent: :destroy #foreign_key: ""
	has_many :collaborators, through: :collabs, source: :user_id

	default_scope order: 'projects.created_at DESC'
end
