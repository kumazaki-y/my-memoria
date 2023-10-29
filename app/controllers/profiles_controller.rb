class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def update
		profile = current_user.profile
		if profile.update(profile_params)
			image_url = rails_blob_url(profile.avatar, disposition: "attachment")
			render json: { status: 'success', image_url: image_url }
		else
			render json: { status: 'error', errors: profile.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private
	def profile_params
		params.require(:profile).permit(:username, :avatar)
	end
end