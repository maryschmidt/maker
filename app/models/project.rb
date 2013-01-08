class Project < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :user
  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
