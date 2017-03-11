class UsersController < ApplicationController
  skip_before_action :set_current_user, only: [:new, :create]
  before_action :set_user, only: [:show, :attack]

  def index
    @users = User.where.not(id: @current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params.merge(ip: request.remote_ip))
    user.save ? redirect_to(users_path) : head(:bad_request)
  end

  def show
  end

  def attack
    Fight.start!(@current_user, @user)
    redirect_to request.referrer
  end

  private

  def user_params
    params.require(:user).permit(:nickname, attack_fights_attributes: [:d])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
