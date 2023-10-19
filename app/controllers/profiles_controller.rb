class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile

	def show
	end

	def edit
	end

	def update
		if @profile.update(profile_params)
			image_url = rails_blob_url(@profile.avatar, disposition: "attachment")
			render json: { status: 'success', image_url: image_url }
		else
			render json: { status: 'error', errors: @profile.errors.full_messages }, status: :unprocessable_entity
		end
	end

  private
  def profile_params
    params.require(:profile).permit(:username, :avatar)
  end

	def set_profile
    @profile = current_user.profile
  end
end