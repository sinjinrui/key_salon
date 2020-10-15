class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  

  def index 
    @events = Event.all.includes(:user).order(id: "DESC")
  end

  def new
  end

  def show 
    @user = User.find(params[:id])
    sort = params[:sort] || "start_at ASC"
    @events = current_user.like_events.includes(:user).order(sort)
  end

end
