# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base

	attr_accessible :name, :email, :password, :password_confirmation, :place, :whatido, :webpage
	has_secure_password
    has_many :microposts, dependent: :destroy
    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relationships, source: :followed
    has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
    has_many :followers, through: :reverse_relationships, source: :follower
    has_many :projects, dependent: :destroy
    has_many :collabs, dependent: :destroy
    has_many :collaborations, through: :collabs, source: :project #reverse?
    has_many :ideas, dependent: :destroy
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :liked_projects, through: :likes, source: :project
    has_many :thrds
    has_many :commenthrds
    has_many :responsibilities, foreign_key: :responsible

	before_save :create_remember_token

	validates :name,  presence: true, length: { maximum: 50 }
    valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: valid_email_regex }, 
                      uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 6}

    #def feed
    #   Micropost.where("User_id =  ?", id)
    #end

    def following?(other_user)
        relationships.find_by_followed_id(other_user.id)
    end

    def follow!(other_user)
       relationships.create!(followed_id: other_user.id)
    end

    def unfollow!(other_user)
        relationships.find_by_followed_id(other_user.id).destroy
    end

    def feed
        Micropost.from_users_followed_by(self)
    end

    def join!(project)
        collabs.create!(project_id: project.id)
    end

    def leave!(project)
        collabs.find_by_project_id(project.id).destroy
    end

    def collab?(project)
       collabs.find_by_project_id(project.id) 
    end

    private

    	def create_remember_token
    		self.remember_token = SecureRandom.urlsafe_base64
    	end
end