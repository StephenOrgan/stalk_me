class Like < ActiveRecord::Base
  attr_accessible :event_id

  validates :event, presence: true
  validates :user, presence: true

  belongs_to :users
  belongs_to :events

end
