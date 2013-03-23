class Comment < ActiveRecord::Base
  attr_accessible :body, :event_id

  belongs_to :users
  belongs_to :events
end
