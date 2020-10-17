class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  

  def index 
    @events = Event.page(params[:page]).includes(:user).order(id: "DESC").per(10)
  end

  def new
  end

  def show 
    @user = User.find(params[:id])
    sort = params[:sort] || "start_at ASC"
    @events = current_user.like_events.page(params[:page]).includes(:user).order(sort).per(10)
  end

end
