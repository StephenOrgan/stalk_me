class CommentsController < ApplicationController

  def create
    event = Event.find(params[:event_id])

    @comment = current_user.comments.build(params[:comment])
    @comment.event_id = params[:event_id]

    if @comment.save
      redirect_to events_path
    else
      render 'new'
    end
  end
end
