class Comment < ActiveRecord::Base
  attr_accessible :body

  validates :event, presence: true
  validates :user, presence: true

  belongs_to :user
  belongs_to :event
end
