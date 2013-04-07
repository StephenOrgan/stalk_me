class LikesController < ApplicationController

	def create
		event = Event.find(params[:event_id])

		@like = current_user.likes.build(params[:likes])
		@like.event_id = params[:event_id]

		if @like.save
			redirect_to events_path
		else
			render 'new'
		end
	end
end
