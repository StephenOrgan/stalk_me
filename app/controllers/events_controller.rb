class EventsController < ApplicationController

	def new
  		@event = Event.new
	end

	# POST /events
	def create
		@event = current_user.events.build(params[:event])
		@event.user_id = current_user.id
		@event.likes = 0
		if @event.save
			redirect_to events_path created: true
		else
			render :new
		end
	end

	# GET /events
	def index
		@event = Event.new

		##if params[:user_id]
			##@events = User.find(params[:user_id]).events
			##@events = current_user.events.order('created_at DESC')

			followers = current_user.followers.collect do |follower|
										follower.id
									end
			followers << current_user.id 
			
			@events = Event.where("user_id IN (?)", followers).order('created_at DESC')
			##@events = User.where(:id => current_user.user_id).order().having().group()
		##else
			##@events = Event.order('created_at DESC').all
		##end

		respond_to do |format|
			format.html 
			format.json { render :json => @events }
		end
	end

	# GET /events/1
	def show
		@event = Event.find(params[:id])

		respond_to do |format|
			format.html
			format.jason { render :json => @event }
		end
	end

	# GET /events/1/edit
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
