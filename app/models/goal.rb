class Goal < ActiveRecord::Base
  attr_accessible :goal
  belongs_to :user
end