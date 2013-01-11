class Project < ActiveRecord::Base
  attr_accessible :description, :title, :image
  belongs_to :user
  has_many :steps
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
