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

		@friends = Twitter.friend_ids(user.name).collection

	  	@friends.each do |fid| 
	     	if User.where(uid: fid.to_s).exists?
	      	Follow.create(user_id: user.id.to_s, follower_id: User.where(uid: fid).first.id.to_s)
	     	end
	    end



		sign_in_and_redirect user
	end

end