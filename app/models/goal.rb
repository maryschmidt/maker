class Goal < ActiveRecord::Base
  attr_accessible :goal, :remind_me, :frequency, :status
  belongs_to :user

  def self.unmet
    where(status: false)
  end
end
