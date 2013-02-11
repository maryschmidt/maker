class Asset < ActiveRecord::Base
  attr_accessible :image
  belongs_to :project

  has_attached_file :image, styles: { medium: "350x350>",  small: "200x200#", thumb: "100x100#" }

  def image_url
    image.url(:small)
  end
end
