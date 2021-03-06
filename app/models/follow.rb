class Follow < ActiveRecord::Base
  attr_accessible :follower_id, :user_id

  belongs_to :user
  belongs_to :follower, class_name: 'User'

  validates :follower_id, :uniqueness => {:scope => :user_id}
end
