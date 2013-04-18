class Like < ActiveRecord::Base
  attr_accessible :event_id

  validates :event, presence: true
  validates :user, presence: true

  belongs_to :user
  belongs_to :event

end
