class Project < ActiveRecord::Base
  attr_accessible :description, :title, :image

  belongs_to :user
  has_many :comments
  has_many :steps

  has_attached_file :image, styles: { medium: "300x300>",  small: "200x200#", thumb: "100x100#" }

  def image_url
    image.url(:small)
  end

  def self.recent(count)
    order("updated_at DESC").limit(count)
  end
end
