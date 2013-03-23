class Like < ActiveRecord::Base
  attr_accessible :event_id, :user_id

  belongs_to :users
  belongs_to :events

end
