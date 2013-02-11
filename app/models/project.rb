class Project < ActiveRecord::Base
  attr_accessible :description, :title, :assets_attributes

  belongs_to :user
  has_many :assets
  has_many :comments

  accepts_nested_attributes_for :assets, allow_destroy: true

  def image
    assets.first.image
  end

  def image_url
    assets.first.image.url(:small)
  end

  def self.recent(count)
    order("updated_at DESC").limit(count)
  end
end
