class Project < ActiveRecord::Base

	has_attached_file :cover, storage: :s3, bucket: ENV['S3_BUCKET_NAME'], s3_credentials: { access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']}

	attr_accessible :name, :description, :cover, :profitable, :category_id , :tags, :online, :place, :finished, :likes_count

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

#Iniciativa para turnaround del contador. Eliminar si el cache funciona adecuadamente:
	def inclike
		c = likes_count
		c = c + 1
		update_attributes(likes_count: c)
	end
end
