class UnfollowsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
  
    def create
      current_user.unfollow!(@user)
      redirect_to account_path(@user)
    end

    private
  
    def set_user
      @user = User.find(params[:account_id])
    end
  end
  