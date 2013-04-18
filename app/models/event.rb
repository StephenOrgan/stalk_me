class Event < ActiveRecord::Base
  attr_accessible :description, :link, :name, :user_id

  belongs_to :user

  validates :user, presence: true
  validates :link, presence: true, format: /^http:\/\/.+$/

  has_many :comments
  has_many :likes
end
