class EventsController < ApplicationController

	def new
  		@event = Event.new
	end

	def create
		@event = current_user.events.build(params[:event])

		if @event.save
			redirect_to events_path created: true
		else
			render :new
		end
	end

	def index
		if params[:user_id]
			@events = User.find(params[:user_id]).events
		else
			@events = Event.all
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end

	def user_session
		session[:user_id] = User.find(params[:user_id])
		User.find(session[:user_id])
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

			respond_to do |format|
			format.html { redirect_to events_url }
			format.json {head :no_content }
		end
	end	
end
