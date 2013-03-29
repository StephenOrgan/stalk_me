class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :follows
  has_many :followers, through: :follows
  has_many :comments
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :handle, :image, :name
  # attr_accessible :title, :body

  has_many :events
  has_attached_file :image, :styles => { :thumb => "100x100>"}

  def email_required?
    uid.blank?
  end

  def password_required?
    uid.blank?
  end

end
