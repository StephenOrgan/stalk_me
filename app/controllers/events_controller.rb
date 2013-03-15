class EventsController < ApplicationController

	def new
  		@event = Event.new
	end

	def create
	@event = Event.new(params[:event])
	
	respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

	end

	def index
	@events = Event.all
	end

	def show
	@event = Event.find(params[:id])
	end

end
