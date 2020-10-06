class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index 
    @events = Event.all.order(id: "DESC")
    @wday = ["日", "月", "火", "水", "木", "金", "土"]
  end

  def new
  end

  def show 
    @user = User.find(params[:id])
  end
end
