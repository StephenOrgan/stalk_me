class UsersController < ApplicationController

  def new
  @user = User.new
  end

  def create
  @user = User.new(params[:user])
    
  @Friends = Twitter.friend_ids(@User.name).collection

  @Friends.each do |fid| 
     if User.where(uid: fid).exists?
      Follow.create(user_id: @User.id, follower_id: User.where(uid: fid).first.id)
     end
    end

  end

  def index
  @users = User.all
  end
   
end
