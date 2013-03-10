class User < ActiveRecord::Base
  attr_accessible :handle, :name

  has_many :events

  validates :handle, presence: :true
  validates :name, presence: :true
end
