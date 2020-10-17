class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update, :destroy]

  def index
    sort = params[:sort] || "start_at ASC"
    @events = Event.page(params[:page]).includes(:user).order(sort).per(10)
  end

  def new 
    @event = Event.new
  end

  def create 
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, event_id: @event.id)
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    sort = params[:sort] || "start_at ASC"
    @events = Event.search(params[:keyword]).page(params[:page]).includes(:user).order(sort).per(10)
    @search = params[:keyword] || params[:format]
  end

  private

  def set_event
    @event = Event.find(params[:id])
    @weekday = ["日", "月", "火", "水", "木", "金", "土"][@event.start_at.wday]
  end

  def event_params
    params.require(:event).permit(:name, :start_at, :start_time, :finish_time, :enviroment_id, :place, :explanation, :image).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path unless user_signed_in? && current_user.id == @event.user_id
  end
end
