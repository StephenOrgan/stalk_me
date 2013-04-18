class Devise::OmniauthCallbacksController < ApplicationController
	skip_before_filter :authenticate_user!

	def twitter
		auth = env['omniauth.auth']
		uid = auth['uid'].to_s
		provider = auth['provider']
		name = auth['info']['name']
		handle = auth['info']['nickname']

		user = User.where(uid: uid, provider: provider, name: name, handle: handle).first_or_create do |u|
			u.email = "#{uid}@twitter.com"
		end

		@friends = User.where(uid: Twitter.friend_ids(user.name).collection.map {|item| item.to_s})
		#firends = users whre uid IN twitterId

		#friends.each friend
			#find a follwer with my userid and my friends id if not createa a follow iwth my user_id and my friends user id
		#end

  	@friends.each do |friend|
  		#user.followers.where(:follower_id => friend.id).first_or_create
     	Follow.where(:follower_id => friend.id, :user_id => user.id).first_or_create
    end

		sign_in_and_redirect user
	end

end