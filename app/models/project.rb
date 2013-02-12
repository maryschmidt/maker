class Project < ActiveRecord::Base
  attr_accessible :description, :title, :assets_attributes

  belongs_to :user
  has_many :assets
  has_many :comments

  accepts_nested_attributes_for :assets, allow_destroy: true

  def image
    if assets.any?
      assets.first.image
    else
      Asset.new.image
    end
  end

  def image_url
    if assets.any?
      assets.first.image.url(:small)
    else
      Asset.new.image
    end
  end

  def self.recent(count)
    order("updated_at DESC").limit(count)
  end
end
