class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email, :name, :password
  has_many :projects
  has_many :goals
end
