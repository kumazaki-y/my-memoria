class FollowingsController < ApplicationController
  before_action :set_user

  def index
    @followings = @user.following
  end

  private

  def set_user
    @user = User.find(params[:account_id])
  end
end

