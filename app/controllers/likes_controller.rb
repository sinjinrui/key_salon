class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, event_id: @event.id)
    @like = Like.find_by(user_id: current_user.id, event_id: @event.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, event_id: @event.id)
    @like.destroy
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
