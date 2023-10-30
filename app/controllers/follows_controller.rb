class FollowsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @user = User.find(params[:account_id])
      current_user.follow!(@user)
      render json: { status: 'followed', followerCount: @user.follower.count}
    end

  end
  