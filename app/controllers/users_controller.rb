class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  

  def index 
    @events = Event.all.order(id: "DESC")
  end

  def new
  end

  def show 
    @user = User.find(params[:id])
    @events = current_user.like_events.order(start_at: "ASC")
  end

end
