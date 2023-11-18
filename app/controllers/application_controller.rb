class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_locale
	before_action :record_user_activity


	def default_ulr_options
		{locale: I18n.locale}
	end
	
	private
	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def record_user_activity
		if current_user
		  current_user.update_column(:last_active_at, Time.current)
		end
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end
end
