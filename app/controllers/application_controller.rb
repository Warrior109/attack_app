class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  private

  def set_current_user
    @current_user = User.find_by_ip(request.remote_ip)
    redirect_to new_user_path if @current_user.nil?
  end
end
