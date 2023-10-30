class FollowersController < ApplicationController
  before_action :set_user

  def index
    @followers = @user.follower
  end

  private

  def set_user
    @user = User.find(params[:account_id])
  end
end
