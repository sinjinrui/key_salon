class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_wday

  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :image])
  end

  def set_wday
    @wday = ["日", "月", "火", "水", "木", "金", "土"]
  end
end
