class Step < ActiveRecord::Base
  belongs_to :project

  attr_accessible :name, :detail, :tip, :pic
  validates :name, presence: true

  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }
end
