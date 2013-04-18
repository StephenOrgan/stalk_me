class LikesController < ApplicationController

	def create
		event = Event.find(params[:event_id])

		@like = current_user.likes.build
		@like.event_id = params[:event_id]

		@like.save
	  redirect_to events_path
	end

	def destroy
		@like = Like.find(params[:id])
		@like.destroy
		
		respond_to do |format|
			format.html { redirect_to events_url }
			format.json {head :no_content }
		end
	end	
end

