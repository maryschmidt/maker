class User < ActiveRecord::Base
  include Clearance::User

  attr_accessible :email, :name, :password

  validates :name, presence: true

  has_many :projects
  has_many :goals
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
    class_name:  "Relationship",
    dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :followed_projects, through: :followed_users, source: :projects
  has_many :comments

  def feed
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
end
