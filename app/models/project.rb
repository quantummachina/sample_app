class Project < ActiveRecord::Base
	attr_accessible :name, :description, :cover, :profitable, :category_id , :tags, :online, :place, :finished

	belongs_to :user
	belongs_to :category

	validates :name, presence: true #lenght: { maximum: 50}
	validates :user_id, presence: true
	#validates :description, lenght: { maximum: 500}
	has_many :collabs, dependent: :destroy
	has_many :collaborators, through: :collabs, source: :user
	has_many :resources, dependent: :destroy
	has_many :needs, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :thrds, dependent: :destroy
	has_many :tasks, dependent: :destroy
	has_many :updates, dependent: :destroy

	default_scope order: 'projects.created_at DESC'

	def self.search_pro(search) #Ampliar conforme se desarrolle el nav
		if search
			find(:all, conditions: ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end
end
