class Devise::OmniauthCallbacksController < ApplicationController
	skip_before_filter :authenticate_user!

	def twitter
		auth = env['omniauth.auth']
		uid = auth['uid']
		provider = auth['provider']
		name = auth['info']['name']

		user = User.where(uid: uid, provider: provider, name: name).first_or_create do |u|
			u.email = '#{uid}@twitter.com'
		end

		sign_in_and_redirect user
	end
end