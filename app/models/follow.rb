class Follow < ActiveRecord::Base
  attr_accessible :follower_id, :user_id
end
