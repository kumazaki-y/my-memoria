class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def show
		@profile = current_user.profile
	end

	def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Profile was successfully updated.'
    else
      render :show
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:username, :avatar)
  end
end
